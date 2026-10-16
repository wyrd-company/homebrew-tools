# relationships:
#   tests: update-envconsul
"""Exercise the updater with an HTTP release server and real GPG signatures."""

import hashlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import threading
import unittest
from unittest.mock import patch
from urllib.error import HTTPError


SCRIPT = Path(__file__).resolve().parents[1] / "scripts/update-envconsul.py"
SPEC = importlib.util.spec_from_file_location("update_envconsul", SCRIPT)
updater = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(updater)


class UpdaterTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory()
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.directory = Path(cls.temporary.name)
        cls.keyring = cls.directory / "signing-keyring"
        cls.keyring.mkdir(mode=0o700)
        cls.gpg = ["gpg", "--no-options", "--batch", "--homedir", str(cls.keyring)]
        subprocess.run(
            [*cls.gpg, "--pinentry-mode", "loopback", "--passphrase", "",
             "--quick-generate-key", "Release Signer <signer@example.invalid>",
             "ed25519", "sign", "0"],
            check=True, capture_output=True,
        )
        listing = subprocess.run(
            [*cls.gpg, "--with-colons", "--list-keys"],
            check=True, capture_output=True, text=True,
        ).stdout
        cls.fingerprint = next(
            line.split(":")[9] for line in listing.splitlines() if line.startswith("fpr:")
        )
        cls.public_key = subprocess.run(
            [*cls.gpg, "--armor", "--export"], check=True, capture_output=True,
        ).stdout

    def setUp(self):
        self.release = {"tag_name": "v1.2.3", "draft": False, "prerelease": False}
        self.requests = []
        self.files = {"/key.asc": self.public_key}
        self.archives = {
            platform: f"example archive {platform}".encode() for platform in updater.PLATFORMS
        }
        self.base = "/releases/1.2.3/envconsul_1.2.3"
        self.manifest = "".join(
            f"{hashlib.sha256(data).hexdigest()}  envconsul_1.2.3_{platform}.zip\n"
            for platform, data in self.archives.items()
        )
        for platform, data in self.archives.items():
            self.files[f"{self.base}_{platform}.zip"] = data
        self.sign_manifest(self.manifest)
        owner = self

        class Handler(BaseHTTPRequestHandler):
            def do_GET(self):
                owner.requests.append((self.path, self.headers.get("Authorization")))
                body = (
                    json.dumps(owner.release).encode()
                    if self.path == "/latest" else owner.files.get(self.path)
                )
                self.send_response(200 if body is not None else 404)
                self.end_headers()
                self.wfile.write(body or b"Not found")

            def log_message(self, *_args):
                pass

        server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
        worker = threading.Thread(target=server.serve_forever, daemon=True)
        worker.start()
        self.addCleanup(server.server_close)
        self.addCleanup(worker.join)
        self.addCleanup(server.shutdown)
        origin = f"http://127.0.0.1:{server.server_port}"
        for name, value in (
            ("LATEST_RELEASE", f"{origin}/latest"),
            ("RELEASES", f"{origin}/releases"),
            ("PUBLIC_KEY", f"{origin}/key.asc"),
            ("SIGNING_KEY", self.fingerprint),
        ):
            patcher = patch.object(updater, name, value)
            patcher.start()
            self.addCleanup(patcher.stop)
        formula_directory = tempfile.TemporaryDirectory()
        self.addCleanup(formula_directory.cleanup)
        self.formula = Path(formula_directory.name) / "envconsul.rb"

    def sign_manifest(self, manifest):
        path = self.directory / "SHA256SUMS"
        path.write_text(manifest)
        subprocess.run(
            [*self.gpg, "--yes", "--detach-sign", str(path)],
            check=True, capture_output=True,
        )
        self.files[f"{self.base}_SHA256SUMS"] = path.read_bytes()
        self.files[f"{self.base}_SHA256SUMS.sig"] = path.with_suffix(".sig").read_bytes()

    def test_verified_update_covers_all_platforms_without_leaking_token(self):
        with patch.dict("os.environ", {"GH_TOKEN": "example-token"}):
            updater.update(self.formula)
        formula = self.formula.read_text()
        self.assertIn('  version "1.2.3"', formula)
        for platform, data in self.archives.items():
            with self.subTest(platform=platform):
                self.assertIn(f"envconsul_1.2.3_{platform}.zip", formula)
                self.assertIn(
                    f'url "{updater.RELEASES}/1.2.3/envconsul_1.2.3_{platform}.zip"\n'
                    f'      sha256 "{hashlib.sha256(data).hexdigest()}"',
                    formula,
                )
                self.assertEqual(self.requests.count((f"{self.base}_{platform}.zip", None)), 1)
        self.assertEqual(self.requests[0], ("/latest", "Bearer example-token"))
        self.assertTrue(all(token is None for _, token in self.requests[1:]))

    def test_same_or_older_release_is_a_noop(self):
        for version in ("1.2.3", "1.10.0"):
            with self.subTest(version=version):
                original = f'  version "{version}"\n'
                self.formula.write_text(original)
                self.requests.clear()
                updater.update(self.formula)
                self.assertEqual(self.formula.read_text(), original)
                self.assertEqual([path for path, _ in self.requests], ["/latest"])

    def test_rejects_unstable_or_invalid_release_tags(self):
        for values in (
            {"draft": True}, {"prerelease": True},
            {"tag_name": "v1.2.3-rc1"}, {"tag_name": "../example"},
        ):
            with self.subTest(values=values):
                self.release = {"tag_name": "v1.2.3", "draft": False, "prerelease": False, **values}
                with self.assertRaises(ValueError):
                    updater.update(self.formula)
                self.assertFalse(self.formula.exists())

    def test_corrupt_archive_preserves_existing_formula(self):
        original = '  version "1.0.0"\n'
        for platform, data in self.archives.items():
            with self.subTest(platform=platform):
                self.formula.write_text(original)
                path = f"{self.base}_{platform}.zip"
                self.files[path] = b"corrupted archive"
                with self.assertRaisesRegex(ValueError, "SHA256 mismatch"):
                    updater.update(self.formula)
                self.assertEqual(self.formula.read_text(), original)
                self.files[path] = data

    def test_missing_archive_preserves_existing_formula(self):
        original = '  version "1.0.0"\n'
        self.formula.write_text(original)
        del self.files[f"{self.base}_linux_arm64.zip"]
        with self.assertRaises(HTTPError) as failure:
            updater.update(self.formula)
        failure.exception.close()
        self.assertEqual(self.formula.read_text(), original)

    def test_rejects_unreadable_existing_version(self):
        original = "example formula without a version\n"
        self.formula.write_text(original)
        with self.assertRaisesRegex(ValueError, "Cannot read"):
            updater.update(self.formula)
        self.assertEqual(self.formula.read_text(), original)

    def test_rejects_tampered_manifest(self):
        self.files[f"{self.base}_SHA256SUMS"] += b"tampered\n"
        with self.assertRaises(subprocess.CalledProcessError):
            updater.update(self.formula)
        self.assertFalse(self.formula.exists())

    def test_rejects_wrong_signer(self):
        with patch.object(updater, "SIGNING_KEY", "0" * 40):
            with self.assertRaisesRegex(ValueError, "not signed by"):
                updater.update(self.formula)
        self.assertFalse(self.formula.exists())

    def revoked_public_key(self):
        with tempfile.TemporaryDirectory() as temporary:
            command = ["gpg", "--no-options", "--batch", "--homedir", temporary]
            subprocess.run(
                [*command, "--import"], input=self.public_key,
                check=True, capture_output=True,
            )
            revocation_path = self.keyring / "openpgp-revocs.d" / f"{self.fingerprint}.rev"
            revocation = revocation_path.read_bytes()
            revocation = revocation.replace(b":-----BEGIN", b"-----BEGIN")
            subprocess.run(
                [*command, "--import"], input=revocation,
                check=True, capture_output=True,
            )
            return subprocess.run(
                [*command, "--armor", "--export"], check=True, capture_output=True,
            ).stdout

    def test_rejects_revoked_signing_key(self):
        self.files["/key.asc"] = self.revoked_public_key()
        with self.assertRaisesRegex(ValueError, "not currently valid"):
            updater.update(self.formula)
        self.assertFalse(self.formula.exists())

    def test_rejects_revoked_signer_even_with_another_good_signature(self):
        self.files["/key.asc"] = self.revoked_public_key()
        with tempfile.TemporaryDirectory() as temporary:
            command = ["gpg", "--no-options", "--batch", "--homedir", temporary]
            subprocess.run(
                [*command, "--pinentry-mode", "loopback", "--passphrase", "",
                 "--quick-generate-key", "Other Signer <other@example.invalid>",
                 "ed25519", "sign", "0"],
                check=True, capture_output=True,
            )
            self.files["/key.asc"] += subprocess.run(
                [*command, "--armor", "--export"], check=True, capture_output=True,
            ).stdout
            signature = subprocess.run(
                [*command, "--detach-sign", "--output", "-", str(self.directory / "SHA256SUMS")],
                check=True, capture_output=True,
            ).stdout
            self.files[f"{self.base}_SHA256SUMS.sig"] += signature
        with self.assertRaisesRegex(ValueError, "not signed by"):
            updater.update(self.formula)
        self.assertFalse(self.formula.exists())

    def test_requires_every_platform_in_signed_manifest(self):
        self.sign_manifest("\n".join(self.manifest.splitlines()[:-1]) + "\n")
        with self.assertRaisesRegex(KeyError, "envconsul_1.2.3_linux_arm64.zip"):
            updater.update(self.formula)
        self.assertFalse(self.formula.exists())

    def test_rejects_duplicate_or_malformed_manifest_entries(self):
        for extra in (self.manifest.splitlines()[0] + "\n", "invalid checksum\n"):
            with self.subTest(extra=extra):
                self.sign_manifest(self.manifest + extra)
                with self.assertRaises(ValueError):
                    updater.update(self.formula)
                self.assertFalse(self.formula.exists())


if __name__ == "__main__":
    unittest.main()
