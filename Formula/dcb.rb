# relationships:
#   references: [manifest]
class Dcb < Formula
  desc "Build and run development containers"
  homepage "https://github.com/wyrd-company/devcontainer-builder"
  version "0.1.0"
  license "MIT"
  on_macos do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.1.0/dcb_0.1.0_darwin_x86_64.tar.gz"
      sha256 "f7584d1c6a19abb13243e9d6c635ae7c38c0b9fb96b6bdd321ce9630246809a3"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.1.0/dcb_0.1.0_darwin_aarch64.tar.gz"
      sha256 "9df9fb178a7abfb8cc236575ab4e46e03ff79830c51f5248b08fba3aed66aaf7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.1.0/dcb_0.1.0_linux_x86_64.tar.gz"
      sha256 "4ecec7b8a7ce8cd51e11bfb5ac6f04f2ec6df4632a09a35b53928edeb1dd49d9"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.1.0/dcb_0.1.0_linux_aarch64.tar.gz"
      sha256 "ccafca00014a8d6e8986648445eccdac5494a3b3c08b76aac26d6dd0b24320b9"
    end
  end
  def install
    bin.install "dcb"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/dcb version")
  end
end
