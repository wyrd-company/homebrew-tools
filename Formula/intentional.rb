class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  license "Apache-2.0"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.5/intentional-macos-arm64.tar.gz"
      sha256 "db4be1ed0f804c820f66b0c83608a34347ad1837aa03a40e4d3095d4b27a0cd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.5/intentional-linux-arm64.tar.gz"
      sha256 "26d33089dc375f070ab54e5f42943778784fefc153b9a29f9eed5b9e502e340c"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.5/intentional-linux-x86_64.tar.gz"
      sha256 "3d8a73ad272a5e0720ca45943e6dfc52704e112471ed1c12c7417de28664620c"
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
