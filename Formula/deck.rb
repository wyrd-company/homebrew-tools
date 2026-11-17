class Deck < Formula
  desc "Discord conversations for agents through a secret-holding service"
  homepage "https://github.com/wyrd-company/deck"
  version "0.1.3"
  license "Apache-2.0"
  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.3/deck_0.1.3_darwin_aarch64.tar.gz"
      sha256 "20a8d572cf040d540abc0559697e77e6e06ab65d7e50487e600ecb66ed49631d"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.3/deck_0.1.3_darwin_x86_64.tar.gz"
      sha256 "28513c0a0b5b95e2820471a6e527f9b2d6e721c04e131491122c50abd89b7c0b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.3/deck_0.1.3_linux_aarch64.tar.gz"
      sha256 "9eb075fe33168fba27f4825d25ae429c08309a5f4dfcc57148b714e7dfc6fc7a"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.3/deck_0.1.3_linux_x86_64.tar.gz"
      sha256 "13e2677e80603c9ce73304708665ddaaf24f43d977ccd48549528f064da2bc48"
    end
  end
  def install
    bin.install "deck"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
