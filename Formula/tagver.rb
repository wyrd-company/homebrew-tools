  class Tagver < Formula
    desc "Command-line tool for minimalistic versioning using Git tags"
    homepage "https://github.com/wyrd-company/tagver"
    license "Apache-2.0"
    version "0.1.4"

    on_macos do
      on_arm do
        url "https://github.com/wyrd-company/tagver/releases/download/0.1.4/tagver-macos-arm64.tar.gz"
        sha256 "1e2862f03fb9ea13b364cb6449fa29fe2aff7a261baba4fd8a9f449252b6ee10"
      end
    end

    on_linux do
      on_arm do
        url "https://github.com/wyrd-company/tagver/releases/download/0.1.4/tagver-linux-arm64.tar.gz"
        sha256 "c1938074e6a7e3cde4f35fffdd2c2b3a0b3b6b474efc76df1863e0d6a68f94a6"
      end

      on_intel do
        url "https://github.com/wyrd-company/tagver/releases/download/0.1.4/tagver-linux-x86_64.tar.gz"
        sha256 "20e7581a1576a86ae468d327d765e635f8614d22d833cc0196b9d6ca1bb341b0"
      end
    end

    def install
      bin.install "tagver"
      prefix.install_metafiles
    end

    test do
      assert_match "TagVer", shell_output("#{bin}/tagver --help")
    end
  end
