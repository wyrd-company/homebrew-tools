class Gitpr < Formula
  desc "Review local git worktree branches as lightweight PRs"
  homepage "https://github.com/wyrd-company/gitpr"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.1/gitpr_0.4.1_darwin_arm64.tar.gz"
      sha256 "f777aada83619964aa2b1f0e9b6ff5c451fd77c74f5514253a8d38c2e424c6d1"
    end
    on_intel do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.1/gitpr_0.4.1_darwin_x86_64.tar.gz"
      sha256 "9e818fc0e7c36198b98d22d3a369ae65cbaf6e936877d0ead269b1e3bcbd4729"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.1/gitpr_0.4.1_linux_arm64.tar.gz"
      sha256 "5c40946bc11aa27c33cc884ac612a02c9e8f232363818b0c460addbd3065424b"
    end
    on_intel do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.1/gitpr_0.4.1_linux_x86_64.tar.gz"
      sha256 "a7ec9485d01976d85d705decd95e52a77c7bc7dd682f47450467e89ce11197d3"
    end
  end

  def install
    bin.install "gitpr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitpr --version")
  end
end
