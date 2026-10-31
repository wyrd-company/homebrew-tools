class Gitpr < Formula
  desc "Review local git worktree branches as lightweight PRs"
  homepage "https://github.com/wyrd-company/gitpr"

  on_macos do
    on_arm do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.2/gitpr_0.4.2_darwin_arm64.tar.gz"
      sha256 "445c0b082d0eea88be8ee67999ab500dc0095c0ee463efd0c8017d9cbf533c88"
    end
    on_intel do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.2/gitpr_0.4.2_darwin_x86_64.tar.gz"
      sha256 "e70a93ed28e7769ef1385cf8b5c6e757f85c895d00137b70df66be6fa6542ee9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.2/gitpr_0.4.2_linux_arm64.tar.gz"
      sha256 "f73c4d3a62c6363fc9b570ecc22e3deb69b029c59f92bc2a33a046c7946da444"
    end
    on_intel do
      url "https://github.com/wyrd-company/gitpr/releases/download/0.4.2/gitpr_0.4.2_linux_x86_64.tar.gz"
      sha256 "6aedbeb9874954ed5762a309ca456f5c451b05f4e6f8ec60fafc3def904d0832"
    end
  end

  def install
    bin.install "gitpr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitpr --version")
  end
end
