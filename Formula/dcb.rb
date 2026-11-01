# relationships:
#   references: [manifest]
class Dcb < Formula
  desc "Build and run development containers"
  homepage "https://github.com/wyrd-company/devcontainer-builder"
  version "0.2.1"
  license "MIT"
  on_macos do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.1/dcb_0.2.1_darwin_x86_64.tar.gz"
      sha256 "4a854023908f7ee377dc870d2a2d9ca8ae9ed0445d33f94de063582e3e1b79d3"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.1/dcb_0.2.1_darwin_aarch64.tar.gz"
      sha256 "2fbd40e07f7128de93c04442dfd44f0c068d08ccfe271d1512707c0ba16c135f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.1/dcb_0.2.1_linux_x86_64.tar.gz"
      sha256 "cef3428f8ca6e16dc04985d1cb2f6c8be36d130c5e93210dbfa462d6ba7eec97"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.1/dcb_0.2.1_linux_aarch64.tar.gz"
      sha256 "20f47b5ae0340da4d2cafa3f151966630249d4976913227901853e9df769a912"
    end
  end
  def install
    bin.install "dcb"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/dcb version")
  end
end
