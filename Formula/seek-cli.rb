class SeekCli < Formula
  desc "Agent-friendly CLI for web search, deep research, and scraping"
  homepage "https://github.com/wyrd-company/seek-cli"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.2.0/seek-macos-arm64.tar.gz"
      sha256 "278e8e780575c8e495ffbecc569b88e8c12c8ec3292a5b9a453b13181ac324b5"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.2.0/seek-macos-x86_64.tar.gz"
      sha256 "efd150ba10983441c44d1091613cc1320a775ba98026cdb8d12fc2b24c91b6e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.2.0/seek-linux-arm64.tar.gz"
      sha256 "4f45a2162ed37561ea3db5f00c660a9cca7dcca5799c1d09afc15e101fa18943"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.2.0/seek-linux-x86_64.tar.gz"
      sha256 "7a62236c4792cb8c86cb04df141b8f3795b98dc6be42e90ae25ddb127e1dc2a1"
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
