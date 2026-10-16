class Gitpr < Formula
  desc "Review local git worktree branches as lightweight PRs"
  homepage "https://github.com/wyrd-company/gitpr"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.0/gitpr_0.4.0_darwin_arm64.tar.gz"
      sha256 "9083d332a5ef5e2597a3688d129e243347a84b3ef598212627d3192083baaa45"
    end
    on_intel do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.0/gitpr_0.4.0_darwin_x86_64.tar.gz"
      sha256 "f03a977754625621920daf8daf5952550b1fd772d19cb5a13822cbc96dc4a5a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.0/gitpr_0.4.0_linux_arm64.tar.gz"
      sha256 "2fb209833acb1356467b1792eaf63bc495b77e4244605cd8c850461c20ce445a"
    end
    on_intel do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.0/gitpr_0.4.0_linux_x86_64.tar.gz"
      sha256 "a92933afd9459074cdffb217cd02f87b29105d4ba45557290fdcd71d340cbd1a"
    end
  end

  def install
    bin.install "gitpr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitpr --version")
  end
end
