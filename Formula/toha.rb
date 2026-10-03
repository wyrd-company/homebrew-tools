class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  version "0.2.0"
  license "Apache-2.0"
  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.2.0/toha_0.2.0_macos_aarch64.tar.gz"
      sha256 "5e42a6235e43154e91acf7fa51e752268259e7dcc62be871f2c07b813fdc7f0f"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.2.0/toha_0.2.0_macos_x86_64.tar.gz"
      sha256 "f92e79e2bbbd527d7f4e1cb04173ad308f68984832ef7c7da4b822f65154b82a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.2.0/toha_0.2.0_linux_aarch64.tar.gz"
      sha256 "815c30e5dca44df84ea734e1725bdd6e31fc23e8ba8d980d696a78931ebaaa52"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.2.0/toha_0.2.0_linux_x86_64.tar.gz"
      sha256 "13b35e0dbf09bd2c8522a83dc334759b928a2d1a8a0ccd40d2d139da713a052f"
    end
  end
  def install
    bin.install "toha"
  end
end
