class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.2/toha_0.4.2_macos_aarch64.tar.gz"
      sha256 "dd5aa0467b10d3860ed15e003e4f6ba5f1b79600ba15569826cd650bff22ac7c"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.2/toha_0.4.2_macos_x86_64.tar.gz"
      sha256 "561ab72a702ca7bcafce6b3c18ac8fe8297815aac35d16541aefb57adc972531"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.2/toha_0.4.2_linux_aarch64.tar.gz"
      sha256 "a23625d393595087ee44eea7ddf9f5f8f80198f0f115ccd8d5cd09112618a99e"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.4.2/toha_0.4.2_linux_x86_64.tar.gz"
      sha256 "86c8ae4b16c3aee5b9440024816fe19ec0a273462e31e3953f2a35dc2a9105ce"
    end
  end

  def install
    bin.install "toha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toha --version")
  end
end
