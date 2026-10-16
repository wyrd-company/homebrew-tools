class SeekCli < Formula
  desc "Agent-friendly CLI for web search, deep research, and scraping"
  homepage "https://github.com/wyrd-company/seek-cli"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.0/seek-macos-arm64.tar.gz"
      sha256 "d09e61f9694147f78fdf49ba08431fb205c963055db81c5a0fad157112b1c216"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.0/seek-macos-x86_64.tar.gz"
      sha256 "8750a0d1441e117bf34f464479149646ede9fd361535e65e57c35b523994e1c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.0/seek-linux-arm64.tar.gz"
      sha256 "f7debbaa6693a0d432d02692542edde416fedde0014222674f6039fda2e85df0"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.0/seek-linux-x86_64.tar.gz"
      sha256 "21120864ec5ce1621806288ddd90bcbcea4a4a885e80e934d7009c7e3faefa96"
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
