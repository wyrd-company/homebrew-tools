<!-- relationships:
  documents: update-envconsul
-->
# homebrew-tools

Wyrd Company's Homebrew Tap

## Usage

```sh
brew tap wyrd-company/tools
brew install wyrd-company/tools/<formula>
```

## Formulae

| Formula | Description |
| ------- | ----------- |
| envconsul | Launch a subprocess with environment variables from Consul and Vault |

Install envconsul with `brew install wyrd-company/tools/envconsul`.
The formula uses HashiCorp's release binaries for macOS and Linux on Intel and Arm.

The **Update envconsul** workflow checks the latest stable
[`hashicorp/envconsul` GitHub release](https://github.com/hashicorp/envconsul/releases)
daily at 06:23 UTC and supports manual runs. It updates only `Formula/envconsul.rb`;
previous versions are not kept. Before writing the formula, the updater verifies
the SHA256SUMS GPG signature against HashiCorp's published signing fingerprint
and checks all four archives against that manifest. Verification failures stop
the update. HashiCorp signing-key rotation requires an update to the fingerprint
in `scripts/update-envconsul.py`.

The workflow uses the existing `FORMULAE_PUBLISH_KEY` organization secret to push
the formula to `main`, following the tap publishers' SSH checkout convention.
These pushes run the tap's existing `tests.yml` workflow.

## Development

To run the tap syntax checks locally:

```sh
brew test-bot --only-tap-syntax
```

Run the updater tests with Python and GPG:

```sh
python3 -m unittest discover -s tests -v
```

Run `python3 scripts/update-envconsul.py` to update the formula locally using the
same verification as the scheduled workflow. `GH_TOKEN` is optional for local
GitHub API requests.

## t3c release preparation

`Formula/t3c.rb` is generated from the CLI npm tarball by the client repository's
`scripts/release/render-homebrew.py`. It depends on Node and installs the npm
package with Homebrew's standard npm arguments. The generator reads the package
identity/version and computes SHA256 from the actual archive.

The provisional 0.0.0 formula is for the epic branch only. It must be regenerated
from the published npm tarball before this epic reaches tap main. The finalizer
first completes client acceptance, Bob's client merge and the epic retrospective;
then publishes both npm units during staged finalization. Download the CLI's
published `dist.tarball`, verify its registry integrity, and run in the client
checkout:

```sh
scripts/publish-homebrew-tap.sh /tmp/cli.tgz \
  https://registry.npmjs.org/@wyrd-company/t3code-cli/-/t3code-cli-0.1.0.tgz \
  /path/to/tap-task-checkout
```

That command commits the generated formula in the explicit checkout. Push with
`PUSH_TAP=1` only during authorized finalization. A reviewer checks the regenerated
formula delta; Bob then merges the tap epic PR. Never copy an interim checksum
into a release formula. Local validation uses a temporary `file://` formula with
the matching local library tarball; it does not establish registry availability.
