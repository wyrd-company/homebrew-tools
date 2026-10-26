class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.3.0/intentional-macos-arm64.tar.gz"
  sha256 "dbbc26589ad7a569fee58f0ef5efb83b13e937d5351c2e5f45641c1cd978450f"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.3.0/intentional-linux-arm64.tar.gz"
      sha256 "386e6797f8c419cee31dba5a117d7c398f30fa4d439c960ee1b46407aca87c26"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.3.0/intentional-linux-x86_64.tar.gz"
      sha256 "d27d8cb38037efd0bf8bcad8aea31e4abb68accfe75b6bb78029a257d58aea04"
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
