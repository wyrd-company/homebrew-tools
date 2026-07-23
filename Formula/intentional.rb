class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  license "Apache-2.0"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.4/intentional-macos-arm64.tar.gz"
      sha256 "ce4fa3cd8a8facf4533c01ffe12c2cdb95f51ab278ea2483c3fe076dcfe04ce2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.4/intentional-linux-arm64.tar.gz"
      sha256 "639b206d1164a9327a6ba4e16557453b943e1fb3afa22b7af0f2c4f2ec9fa8e9"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.4/intentional-linux-x86_64.tar.gz"
      sha256 "b97e266da5fb94a73122412e4127ad1e5009824691441d3fb64bf4986895b4ca"
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
