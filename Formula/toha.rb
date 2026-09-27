class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  version "0.1.0"
  license "Apache-2.0"
  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.1.0/toha_0.1.0_macos_aarch64.tar.gz"
      sha256 "dfaef2006aa35975470eaada777b9615520bfd9432a881efceb4c517ce6b68ef"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.1.0/toha_0.1.0_macos_x86_64.tar.gz"
      sha256 "2fa7243d728bbdea18065d6aae9dd552e953337e37c9a5a98b6ce6513df8af89"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.1.0/toha_0.1.0_linux_aarch64.tar.gz"
      sha256 "bf92809313b2daa84a438422d70e793a884afeeaa60dab5c2c0135682f4e6382"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.1.0/toha_0.1.0_linux_x86_64.tar.gz"
      sha256 "6ff38c2a7947e699e20932117da0e5f70062fa0465127f96b5690694eb66794f"
    end
  end
  def install
    bin.install "toha"
  end
end
