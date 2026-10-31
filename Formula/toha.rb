class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.1/toha_0.4.1_macos_aarch64.tar.gz"
      sha256 "846caa1f6716fe7a0db724ac0bf54cf57e996eefc128b0ffbfc2d20c522415da"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.1/toha_0.4.1_macos_x86_64.tar.gz"
      sha256 "102e4597afa6c19f197a63ad5a7f0d3ff2f45fb27ce5e922948b0afb92d40647"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.1/toha_0.4.1_linux_aarch64.tar.gz"
      sha256 "6e5434432c0cd550c168e6e70490e5554e241d1a9b153659defb3d21019c1b49"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.1/toha_0.4.1_linux_x86_64.tar.gz"
      sha256 "9683b39b18dd860b9403f6e911c590dff992fa3179323dd1bc96faca8b518161"
    end
  end

  def install
    bin.install "toha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toha --version")
  end
end
