class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.1.8/intentional-macos-arm64.tar.gz"
  sha256 "980322161e2d899ec32768879fa3229efe08d5e9211ff78f1548faac6d96ed37"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.8/intentional-linux-arm64.tar.gz"
      sha256 "1efbd5db87875224fa8f048b8d3c5ba0cfce5e18559670c83fbbfb3b404afe9f"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.1.8/intentional-linux-x86_64.tar.gz"
      sha256 "f199304f9f1dfde0daffa9267904a54f98f06d9a6177817f655db5089c42d355"
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
