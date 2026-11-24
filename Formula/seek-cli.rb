class SeekCli < Formula
  desc "Agent-friendly CLI for web search, deep research, and scraping"
  homepage "https://github.com/wyrd-company/seek-cli"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.2/seek-macos-arm64.tar.gz"
      sha256 "6fde371cafdee0a277da12ab57b106a13f8788e3475b4e0b4aefc875d0ea7851"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.2/seek-macos-x86_64.tar.gz"
      sha256 "f3b3e2cce8e17b33d873be4dcd61bb2e56266253c9a84b224b58a95eb7ca4f25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.2/seek-linux-arm64.tar.gz"
      sha256 "522c7b244de630df43d5f6f156a8565421728503a33ce7a1bdcd1b25d8f37ac6"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.3.2/seek-linux-x86_64.tar.gz"
      sha256 "f2775bfe507e527d5d48aef859bedb9268bafb589a368fc1f134f1020f8dffd9"
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
