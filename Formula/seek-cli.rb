class SeekCli < Formula
  desc "Agent-friendly CLI for web search, deep research, and scraping"
  homepage "https://github.com/wyrd-company/seek-cli"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.1/seek-macos-arm64.tar.gz"
      sha256 "d9fa0d0e3e0d45fc991cba10c3ea04507ff530f2ba34d4fb4f543f8f64b42395"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.1/seek-macos-x86_64.tar.gz"
      sha256 "83357b5a4289c662dbcee3300c77fe9980efe69074e1c8c5b8187a42cbf6f601"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.1/seek-linux-arm64.tar.gz"
      sha256 "5f9b2d28f8e5ee6dfa4c1f5373583be6786ec21e734616abee982ad8045eb7f0"
    end

    on_intel do
      url "https://github.com/wyrd-company/seek-cli/releases/download/0.1.1/seek-linux-x86_64.tar.gz"
      sha256 "32f3e34d92c118716ec8bee15d248cde0b0bf3d148285882703e302514c18418"
    end
  end

  def install
    bin.install "seek"
    prefix.install_metafiles
  end

  test do
    assert_match(/\A\d+\.\d+\.\d+\z/, shell_output("#{bin}/seek --version").strip)
  end
end
