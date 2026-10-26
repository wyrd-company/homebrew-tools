class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.2.1/intentional-macos-arm64.tar.gz"
  sha256 "d9f57623da46050d9b9defd7b017081974c714458aa7f15459c8b169e62cd593"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.2.1/intentional-linux-arm64.tar.gz"
      sha256 "42b4b2369b1c75db77188d11bf7f44afb7eb64ac0249f965957fcdb4c6fb23e7"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.2.1/intentional-linux-x86_64.tar.gz"
      sha256 "22da77977b4a41769b7063ef3b75b3b1d1a60aba908697f1d4d9d294507d112c"
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
