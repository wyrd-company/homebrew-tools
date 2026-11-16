class Deck < Formula
  desc "Discord conversations for agents through a secret-holding service"
  homepage "https://github.com/wyrd-company/deck"
  version "0.1.1"
  license "Apache-2.0"
  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.1/deck_0.1.1_darwin_aarch64.tar.gz"
      sha256 "7b64496f284f55c2602040f40f876ddc676a564601339892bbf82486526ad437"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.1/deck_0.1.1_darwin_x86_64.tar.gz"
      sha256 "d355f63300d4c96a04e98dea8e28144d6dfcc64eb496470bae6bf689ced5d461"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.1/deck_0.1.1_linux_aarch64.tar.gz"
      sha256 "1b3ee4c4d7cb24c0902abe00025e8a5e2bdc56dcb340c032ba3a30fe8d89ad0a"
    end
    on_intel do
      url "https://github.com/wyrd-company/deck/releases/download/0.1.1/deck_0.1.1_linux_x86_64.tar.gz"
      sha256 "ff21b61cd55917771c5db17d5a9b36f2d485f043fc7119942963b7715db91912"
    end
  end
  def install
    bin.install "deck"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/deck --version")
  end
end
