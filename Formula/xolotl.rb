class Xolotl < Formula
  desc "LLM subscription proxy and AI gateway backed by OpenBao"
  homepage "https://github.com/wyrd-company/xolotl"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm

    url "https://github.com/wyrd-company/xolotl/releases/download/0.6.0/xolotl-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "6cc57a46db8beea50fe52c2b89af27c37b7ad85157c3e3fd622738f8c01043d8"
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/xolotl/releases/download/0.6.0/xolotl-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1aeb5eb938c00a87bd7dba1b873990a23c902db433e0e163dbd813b39c31d6f"
    end

    on_intel do
      url "https://github.com/wyrd-company/xolotl/releases/download/0.6.0/xolotl-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9286b0e5c334700a54c188a970b124f0dbb5ca2a2d30bccfa35e9af1ba6f9633"
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
