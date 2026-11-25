class Xolotl < Formula
  desc "LLM subscription proxy and AI gateway backed by OpenBao"
  homepage "https://github.com/wyrd-company/xolotl"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm

    url "https://github.com/wyrd-company/xolotl/releases/download/0.7.0/xolotl-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "6601d0214f5e856a31a6561ec6762b680c6b1dc641bd39057cb2bcd882faf4ac"
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/xolotl/releases/download/0.7.0/xolotl-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8b672b69350002414be54a40341d0d937cbd8e2666d0a80f9f34e909497bc78"
    end

    on_intel do
      url "https://github.com/wyrd-company/xolotl/releases/download/0.7.0/xolotl-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c23687ca075cb42039a694693ee5bfa1faf94576f4b9b5c54b7e226db791be54"
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
