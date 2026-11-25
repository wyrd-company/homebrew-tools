class SeekCli < Formula
  desc "Agent-friendly CLI for web search, deep research, and scraping"
  homepage "https://github.com/wyrd-company/seek-cli"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.4.0/seek-macos-arm64.tar.gz"
      sha256 "b8d7e8880cc26bb50893cb736ba6586b6b378ed1bb8af5467612dc24860c1b31"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.4.0/seek-macos-x86_64.tar.gz"
      sha256 "47de2bb296d9d6b5e77c6a4b71aad415ce706f773bc419a8d66186f6246d38e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.4.0/seek-linux-arm64.tar.gz"
      sha256 "01711c8406867818d426b7583966a89ba371fef66d276b888db750cf355865e9"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.4.0/seek-linux-x86_64.tar.gz"
      sha256 "45512cebd57488f03c0b61b769f3fb664acef6edf8bd5eb71a0114c1d9bb6125"
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
