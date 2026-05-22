class SeekCli < Formula
  desc "Agent-friendly CLI for web search, deep research, and scraping"
  homepage "https://github.com/wyrd-company/seek-cli"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.0/seek-macos-arm64.tar.gz"
      sha256 "e3091934e465e30b669ad0ac1e0cc73dcdbaf39ce05c0b7ba24917ccc858a506"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.0/seek-macos-x86_64.tar.gz"
      sha256 "feaa2fd99b523ed9311b0bd5064674848ab2c475e6993b3e4009144c4a30c740"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.0/seek-linux-arm64.tar.gz"
      sha256 "4d980060e92f79698afbd6f542d93a62fbaeee96bd2df3e93082937929881c15"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.0/seek-linux-x86_64.tar.gz"
      sha256 "f1c444f0e39288720af3735edb397ccee1fdca9c66cfdfe0813b0e907e0462e6"
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
