class Xolotl < Formula
  desc "LLM subscription proxy and AI gateway backed by OpenBao"
  homepage "https://github.com/wyrd-company/xolotl"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm

    url "https://github.com/wyrd-company/xolotl/releases/download/0.6.1/xolotl-0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "ac84c6a33eeda37ee293d6ddc516d51d7a9471934a8f4d8521fbb787bc2fcc75"
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/xolotl/releases/download/0.6.1/xolotl-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8b5ee634837735ffe83e8ca854b84f6ab2f1fb5f96416cb6a3193b831e5d5ab"
    end

    on_intel do
      url "https://github.com/wyrd-company/xolotl/releases/download/0.6.1/xolotl-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "283bb7502aad58ca442d4e2fcaec10d5c11e52b0f4ee2477aac0ca4d3750c4f3"
    end
  end

  def install
    bin.install "xolotl"
    prefix.install_metafiles
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xolotl --version")
  end
end
