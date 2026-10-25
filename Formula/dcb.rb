# relationships:
#   references: [manifest]
class Dcb < Formula
  desc "Build and run development containers"
  homepage "https://github.com/wyrd-company/devcontainer-builder"
  version "0.2.0"
  license "MIT"
  on_macos do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.0/dcb_0.2.0_darwin_x86_64.tar.gz"
      sha256 "a3a17d0978836d66dd6ab88b9db4090c554fa3b39523a692a4931f6a2a66b813"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.0/dcb_0.2.0_darwin_aarch64.tar.gz"
      sha256 "6073d84eced9abbbeece2112af1bacf36b398c5013f990c548ca5ade2a66514d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.0/dcb_0.2.0_linux_x86_64.tar.gz"
      sha256 "c3906a74482db3ac19a0dfc1d0852627cc214100bba1931831040d66b632963e"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.2.0/dcb_0.2.0_linux_aarch64.tar.gz"
      sha256 "21b58e3e44c01cf6a6cd3b2b59eb1b7f05cb2e42ef88f8510aa8d8a498238478"
    end
  end
  def install
    bin.install "dcb"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/dcb version")
  end
end
