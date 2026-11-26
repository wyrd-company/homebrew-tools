class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.1/toha_0.5.1_macos_aarch64.tar.gz"
      sha256 "6623e1a936fd648bb17465af805d39fe28f0e924341b129b2648d6578eb46bda"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.1/toha_0.5.1_macos_x86_64.tar.gz"
      sha256 "7002d85a525cecbdc81a68fa70cee07000662f119cc250c3b1132ca658d2cd10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.1/toha_0.5.1_linux_aarch64.tar.gz"
      sha256 "828fb74d0fb3936c395237b12a675b01c8d68a71bb073a7c9541d47a9f419a71"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.5.1/toha_0.5.1_linux_x86_64.tar.gz"
      sha256 "764891a397e7d3b83d6ae775bc9fa0a3dfea01d90292f27dcce134b11e54b2ad"
    end
  end

  def install
    bin.install "toha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toha --version")
  end
end
