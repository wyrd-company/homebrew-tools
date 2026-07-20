  class Intentional < Formula
    desc "Intent-driven polyglot release and versioning tool"
    homepage "https://github.com/wyrd-company/intentional"
    license "Apache-2.0"
    version "0.1.0"

    on_macos do
      on_arm do
        url "https://github.com/wyrd-company/intentional/releases/download/0.1.0/intentional-macos-arm64.tar.gz"
        sha256 "7b83e73754f21db4dbc6e1dd4b4060c4e68b6765a8232aecb21579888b60eef5"
      end
    end

    on_linux do
      on_arm do
        url "https://github.com/wyrd-company/intentional/releases/download/0.1.0/intentional-linux-arm64.tar.gz"
        sha256 "8579a7a2b12bba5d2a8cded2003fa35f2e06123cffb9537bf280dc87cd34fb8a"
      end

      on_intel do
        url "https://github.com/wyrd-company/intentional/releases/download/0.1.0/intentional-linux-x86_64.tar.gz"
        sha256 "c56bdf6e817f63ffffdb584e0cb404d1861c1392491543ebd0806e093bb410e5"
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
