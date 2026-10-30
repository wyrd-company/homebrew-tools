class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.4.0/intentional-macos-arm64.tar.gz"
  sha256 "8c903836f3ea3c1f683523f3e02dbca61b15f4a8f6d8647cb899a2a57455e144"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.4.0/intentional-linux-arm64.tar.gz"
      sha256 "a875ba0ce4e255ba9c52e61095cb46ca538b402cbeb0386934644dfe80cb2a13"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.4.0/intentional-linux-x86_64.tar.gz"
      sha256 "776ed67573c7bca53e426e85951a2ed613c42b7a443f5f0fca78d0473f9658ef"
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
