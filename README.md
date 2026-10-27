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
| t3c | Run T3 Code conversations from the terminal and automation |

Install t3c with `brew install wyrd-company/tools/t3c`.
The formula installs the published `@wyrd-company/t3code-cli` npm package and Node.
See the [t3c documentation](https://wyrd.foo/docs/t3c) for connection setup and commands.

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
