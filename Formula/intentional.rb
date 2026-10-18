class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.1.7/intentional-macos-arm64.tar.gz"
  sha256 "8f1889860f983c7b36e80fe1968bca9085c89e0517f739664a171fcced653e21"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.7/intentional-linux-arm64.tar.gz"
      sha256 "b1887e9bd6ecb2b718d5849829d7ade16d4d22d803a029e6439b784508520977"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.7/intentional-linux-x86_64.tar.gz"
      sha256 "d27b8ccf0d9cc03bf8d2e758ab463ba6f06ae48a5cc9df1ff38ae340aedcd02a"
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
