  class Intentional < Formula
    desc "Intent-driven polyglot release and versioning tool"
    homepage "https://github.com/wyrd-company/intentional"
    license "Apache-2.0"
    version "0.1.1"

    on_macos do
      on_arm do
        url "https://github.com/wyrd-company/intentional/releases/download/0.1.1/intentional-macos-arm64.tar.gz"
        sha256 "50c62f7bb29362c1fe00df9034907a1ae00f93848dbe6224cd0052eb8c5062f8"
      end
    end

    on_linux do
      on_arm do
        url "https://github.com/wyrd-company/intentional/releases/download/0.1.1/intentional-linux-arm64.tar.gz"
        sha256 "0adf43e4e13a4728a58c4d0353360bfdfb0233d382ca664fa1e5341339fd44cd"
      end

      on_intel do
        url "https://github.com/wyrd-company/intentional/releases/download/0.1.1/intentional-linux-x86_64.tar.gz"
        sha256 "96ba1f2f606ba1c41616a9f3f86ce8436f379d5e6e99ac2af740e5ac0450b52b"
      end
    end

    def install
      bin.install "intentional"
      prefix.install_metafiles
    end

    test do
      assert_match "Intent-driven", shell_output("#{bin}/intentional --help")
    end
  end
