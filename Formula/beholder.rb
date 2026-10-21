class Beholder < Formula
  desc "Structural code index: symbols, complexity, and change-scoped risk"
  homepage "https://github.com/wyrd-company/beholder"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/beholder/releases/download/0.1.1/beholder-macos-arm64.tar.gz"
      sha256 "dc7c66880c769412c74532ee95e17740511e87ce7786eac071b62b2a3183120f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/beholder/releases/download/0.1.1/beholder-linux-arm64.tar.gz"
      sha256 "7ac29305620a15437d6c5330c016b4573f2c8bc71cfb167c0102c176d0ed446d"
    end

    on_intel do
      url "https://github.com/wyrd-company/beholder/releases/download/0.1.1/beholder-linux-x86_64.tar.gz"
      sha256 "2335fd422e39fc967f52ef9ad63aa7742030fafbbd50df3d2dfe11023421327a"
    end
  end

  def install
    bin.install "beholder"
    prefix.install_metafiles
  end

  test do
    assert_match "structural code index", shell_output("#{bin}/beholder --help")
  end
end
