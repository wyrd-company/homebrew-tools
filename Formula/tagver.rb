class Tagver < Formula
  desc "Command-line tool for minimalistic versioning using Git tags"
  homepage "https://github.com/wyrd-company/tagver"
  url "https://github.com/wyrd-company/tagver/releases/download/0.1.5/tagver-macos-arm64.tar.gz"
  version "0.1.5"
  sha256 "d5111fc0e67e215bbeefa491f72ac169fdd7ce4b40afdeac6e9fa763bd946958"
  license "Apache-2.0"

  on_macos do
    on_intel do
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/tagver/releases/download/0.1.5/tagver-linux-arm64.tar.gz"
      sha256 "5739e26cd165c04e2bf11073dcc88f2ef4411046e22020115ec04f9c60d03469"
    end

    on_intel do
      url "https://github.com/wyrd-company/tagver/releases/download/0.1.5/tagver-linux-x86_64.tar.gz"
      sha256 "18926396e03da2427d135a1a819af9ed02e5f20e120deac0cf8450d214594aef"
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
