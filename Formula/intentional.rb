class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  license "Apache-2.0"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.3/intentional-macos-arm64.tar.gz"
      sha256 "f4fabde0e57e41905dd0b8fc0d5eab389007555ff44c8f6f49d43359475defe2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.3/intentional-linux-arm64.tar.gz"
      sha256 "97ed58ba516fb8077e21ed48247732fbcbe19e53b6fd4386f6eeb4850277f142"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.3/intentional-linux-x86_64.tar.gz"
      sha256 "c7ab61474b42f1ce71da9ec8ac6491a994d8ac68a170588ed0f003f847c99721"
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
