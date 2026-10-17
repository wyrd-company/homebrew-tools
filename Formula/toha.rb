class Toha < Formula
  desc "Generate projects and files from templates"
  homepage "https://github.com/wyrd-company/toha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.3.0/toha_0.3.0_macos_aarch64.tar.gz"
      sha256 "3e3f629a4e0d293d1a7145a10e33eca79864b1daa1922d6457afa57b92ddcced"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.3.0/toha_0.3.0_macos_x86_64.tar.gz"
      sha256 "42e659c9b109cde5688482518cb305a3c724dab7631ae9c7d875b7cb5852ff75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/toha/releases/download/0.3.0/toha_0.3.0_linux_aarch64.tar.gz"
      sha256 "afaabbd919f827ef228f7a85fdd039012ec026ea914cdfe8fcc13714476f2b03"
    end
    on_intel do
      url "https://github.com/wyrd-company/toha/releases/download/0.3.0/toha_0.3.0_linux_x86_64.tar.gz"
      sha256 "b469bc396f7673d19d4ae1e8d4df85b768ed6339a2e1d577224e705dd779c146"
    end
  end

  def install
    bin.install "toha"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toha --version")
  end
end
