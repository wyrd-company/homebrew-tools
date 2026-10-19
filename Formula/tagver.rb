class Tagver < Formula
  desc "Command-line tool for minimalistic versioning using Git tags"
  homepage "https://github.com/wyrd-company/tagver"
  url "https://github.com/wyrd-company/tagver/releases/download/0.1.7/tagver-macos-arm64.tar.gz"
  sha256 "d81f4c73a602007e0944b60219470b0b3b760867d4209a53de893fcc3e020d3a"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/tagver/releases/download/0.1.7/tagver-linux-arm64.tar.gz"
      sha256 "29abb481b62a29f1ea6442ea53bdfffda0c9ea55daa71487eff23bd44632b4f4"
    end

    on_intel do
      url "https://github.com/wyrd-company/tagver/releases/download/0.1.7/tagver-linux-x86_64.tar.gz"
      sha256 "61a01103b4cc5fa1672dc15a04c90f09ebbc0bff0f8e023b7db163a3281a59a8"
    end
  end

  def install
    bin.install "tagver"
    prefix.install_metafiles
  end

  test do
    assert_match "Calculate version numbers", shell_output("#{bin}/tagver --help")
  end
end
