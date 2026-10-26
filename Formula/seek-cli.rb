class SeekCli < Formula
  desc "Agent-friendly CLI for web search, deep research, and scraping"
  homepage "https://github.com/wyrd-company/seek-cli"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.1/seek-macos-arm64.tar.gz"
      sha256 "9203c856168dbf8d68d8cdbd8523b70e67b176f1ac7c466520064cec122e41eb"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.1/seek-macos-x86_64.tar.gz"
      sha256 "b38315f6ef294432c16a86113d878bbcc40058a65aa705a2db24ce752658eaa6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.1/seek-linux-arm64.tar.gz"
      sha256 "168d66f5c7861c5785da6ea958715f26ba3de26bd14aa5484ecea4f67636f7aa"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.1/seek-linux-x86_64.tar.gz"
      sha256 "32a2386b659e70561ca0f4d742cb8a3f908d09760364693784fa6adca0290521"
    end
  end

  def install
    bin.install "seek"
    prefix.install_metafiles
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/seek --version")
  end
end
