class Deck < Formula
  desc "Discord conversations for agents through a secret-holding service"
  homepage "https://github.com/wyrd-company/deck"
  version "0.1.0"
  license "Apache-2.0"
  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.0/deck_0.1.0_darwin_aarch64.tar.gz"
      sha256 "8d32fd36672e5f862788216b24f4e86790c857af8129c4023131e138684da8cb"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.0/deck_0.1.0_darwin_x86_64.tar.gz"
      sha256 "b1eef7d91635d599f976302dec6a595a18055565d653961afa4287c011bb5281"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.0/deck_0.1.0_linux_aarch64.tar.gz"
      sha256 "5facd94c2911b985b78f04071c675e68f612d7ffcee1779a92538a0384150800"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.0/deck_0.1.0_linux_x86_64.tar.gz"
      sha256 "7985faf3a1efbaec236949d4f539a4fb9c1f4ceccd40224dcfe31936d1f0c40d"
    end
  end
  def install
    bin.install "deck"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
