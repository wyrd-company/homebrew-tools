class Deck < Formula
  desc "Discord conversations for agents through a secret-holding service"
  homepage "https://github.com/wyrd-company/deck"
  version "0.1.2"
  license "Apache-2.0"
  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.2/deck_0.1.2_darwin_aarch64.tar.gz"
      sha256 "0901a01637f1c8453055fa957c07c2ef1c3ff1a39f7bc3332057197b35186e21"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.2/deck_0.1.2_darwin_x86_64.tar.gz"
      sha256 "c6c768ea994bf8057bd3d7489df3f708c38b8d994f90d466ac99f4232facf0a3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.2/deck_0.1.2_linux_aarch64.tar.gz"
      sha256 "b8e6548de61403b65e636688e6b93c3afb342c79e1edf22ef52ee3502cfe166a"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.2/deck_0.1.2_linux_x86_64.tar.gz"
      sha256 "2bbb4b230daba694b1c473e80f91e62d6f496678216738ebc4bc0b01c96c1723"
    end
  end
  def install
    bin.install "deck"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
