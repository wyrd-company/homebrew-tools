class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.4.1/intentional-macos-arm64.tar.gz"
  sha256 "222966baa1d44b6f6e59b307bdd86bb8d1f8942ba8f07b910027e6be29568050"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.4.1/intentional-linux-arm64.tar.gz"
      sha256 "db7d8731b57134c7a69414c84c19ce866684b80d7ac4a2442bb8e7e6eea2389f"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.4.1/intentional-linux-x86_64.tar.gz"
      sha256 "d149b90aabb0fd8b424c6ecd2fa0b657afa1b08c2dda83a53042cbc1f5dbb22a"
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
