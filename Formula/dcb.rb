# relationships:
#   references: [manifest]
class Dcb < Formula
  desc "Build and run development containers"
  homepage "https://github.com/wyrd-company/devcontainer-builder"
  version "0.3.0"
  license "MIT"
  on_macos do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.3.0/dcb_0.3.0_darwin_x86_64.tar.gz"
      sha256 "9d48fea6f385cd87a10bde323ae2303ad71cd141b56a6ca0f0844fb898a01414"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.3.0/dcb_0.3.0_darwin_aarch64.tar.gz"
      sha256 "324168069a46f4989d131b28699299529e03c58ac682bf3586c8b11fe0cdc56f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.3.0/dcb_0.3.0_linux_x86_64.tar.gz"
      sha256 "af3141bdc7abcb260b20a9d50375661d84fd3bdb40cbaf6e2bc713697efa0d1d"
    end
    on_arm do
      url "https://github.com/wyrd-company/devcontainer-builder/releases/download/0.3.0/dcb_0.3.0_linux_aarch64.tar.gz"
      sha256 "ee9f19c2bf9058fbde239044dc0d6b421db0c5eb513a32e88cb565ce2b17ef57"
    end
  end
  def install
    bin.install "dcb"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/dcb version")
  end
end
