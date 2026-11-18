class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.5.0/intentional-macos-arm64.tar.gz"
  sha256 "2c643c88c4830970aef89851feeae7d81a8fbb26c093278fb1fd7931ed1422ab"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.5.0/intentional-linux-arm64.tar.gz"
      sha256 "74c90e57bb70dd0fe29f9f8d7e126588fdf687fdd0c55b1fc1ef3bb45429d5e2"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.5.0/intentional-linux-x86_64.tar.gz"
      sha256 "0b348672b89637f0f4c64b9fc62a72a7df7401ff0b74766bc165e512b3a7a24b"
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
