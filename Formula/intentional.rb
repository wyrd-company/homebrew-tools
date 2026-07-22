class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  license "Apache-2.0"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.2/intentional-macos-arm64.tar.gz"
      sha256 "49f45c9dd810def49c08c18b77d2cf502e2fbd021c322a798b9a89c7de54a251"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.2/intentional-linux-arm64.tar.gz"
      sha256 "91d9fd3fc83fed510239ceddaf60088bbcf14d434551e6d30f86881813a1645b"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.2/intentional-linux-x86_64.tar.gz"
      sha256 "7c5962b230f94e003ad27c482e726dc8f09f16d12ef9eb2c90eea90ee26bd0e5"
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
