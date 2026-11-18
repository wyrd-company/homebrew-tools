class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.0/toha_0.5.0_macos_aarch64.tar.gz"
      sha256 "6cc0a4096f17f4ce7ac20deb2aae77f989d901591fbaffcccc0e7b821a8af38f"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.0/toha_0.5.0_macos_x86_64.tar.gz"
      sha256 "271acf64dd7700c8279c26fe1e7fca26d6f02b053db0ff1c6d792a83d121601a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.0/toha_0.5.0_linux_aarch64.tar.gz"
      sha256 "a1b2fb7c5a79a0c00b7df813d6a2d14f44e729d41b7ea781d0a5942cf0b5f9e8"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.0/toha_0.5.0_linux_x86_64.tar.gz"
      sha256 "35fabd2cd6a986f0d7f90cdd576e5c28c00db5abd61775c3436656108793a71d"
    end
  end

  def install
    bin.install "toha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toha --version")
  end
end
