class Intentional < Formula
  desc "Intent-driven polyglot release and versioning tool"
  homepage "https://github.com/wyrd-company/intentional"
  url "https://github.com/wyrd-company/intentional/releases/download/0.2.0/intentional-macos-arm64.tar.gz"
  sha256 "8de417affce82bcda9b84fe0411b596d633cb209f927fbbfaccda2a103993a26"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/intentional/releases/download/0.2.0/intentional-linux-arm64.tar.gz"
      sha256 "8c3d7c0e6fb5eb5669a224e460af3b4afd13fe1ed4aa0413485745c3d66600bf"
    end

    on_intel do
      url "https://github.com/wyrd-company/intentional/releases/download/0.2.0/intentional-linux-x86_64.tar.gz"
      sha256 "2456a39d2116f54bf79ae402f32f339935f718ea9258f9de740c4057f02ff77b"
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
