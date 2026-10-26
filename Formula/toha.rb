class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.0/toha_0.4.0_macos_aarch64.tar.gz"
      sha256 "5255805bbc6d7d58999baf5c5b431b14c31e24758aacd65d19962a97bbb745de"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.0/toha_0.4.0_macos_x86_64.tar.gz"
      sha256 "50f1d22a016cb326e6a8c657b5da36d2c96e8c45d71265e15449b14358238784"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.0/toha_0.4.0_linux_aarch64.tar.gz"
      sha256 "750efbd785196a7b0f220e31c86aaa8b7329310a56f30c7acac5cf6af8bbdd8e"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.0/toha_0.4.0_linux_x86_64.tar.gz"
      sha256 "cdbd95c4d1fbe47a41a1783b34eadb08057f0be62f27faf3b51fc5217941bd1d"
    end
  end

  def install
    bin.install "toha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toha --version")
  end
end
