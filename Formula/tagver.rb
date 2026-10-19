class Tagver < Formula
  desc "Command-line tool for minimalistic versioning using Git tags"
  homepage "https://github.com/wyrd-company/tagver"
  url "https://github.com/wyrd-company/tagver/releases/download/0.1.6/tagver-macos-arm64.tar.gz"
  sha256 "c8b67b84d9b8cb0d876f1d3c28cfe07a8d17e3a6aef890aee0cae1aae11a978f"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/tagver/releases/download/0.1.6/tagver-linux-arm64.tar.gz"
      sha256 "b6d674a7d50f4e20d22765db4dce815f54949ece0c63ee4c6099529b25147658"
    end

    on_intel do
      url "https://github.com/wyrd-company/tagver/releases/download/0.1.6/tagver-linux-x86_64.tar.gz"
      sha256 "df96dfbf7d232fc5d266a78d58b1490c3c9cc7b3887d4e8512bf57b344de4db6"
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
