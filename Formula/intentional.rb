class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  license "Apache-2.0"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.6/intentional-macos-arm64.tar.gz"
      sha256 "966a4a6beb3c2ee5fe0170cc449f2c59d35bac9f9dd1384d4ef994339b4bba43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.6/intentional-linux-arm64.tar.gz"
      sha256 "2d1ad674731fa877b3370439c1adecceba6b695004cb23d387cc31787c73a88f"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.6/intentional-linux-x86_64.tar.gz"
      sha256 "1b0d01c4f59be07abdbbaa38e12c4c6bd351b27aaac4cb6f1133ebd148d57a4e"
    end
  end

  def install
    bin.install "intentional"
    prefix.install_metafiles
  end

  test do
    assert_match "Intent-driven", shell_output("#{bin}/intentional --help")
  end
end
