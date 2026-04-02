class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.22"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.22/lingtai-darwin-arm64"
      sha256 "f23ff5e367089bd4b3eaa9fd282e0e69218a5ab5a1b87dacbf5be174450c0b9b"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.22/lingtai-darwin-x64"
      sha256 "ea1336842ef09746b027919f75030d1e3fd550059e2e72f308c7a4b07f093113"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.22/lingtai-linux-arm64"
      sha256 "1f6bad81486a4b9230e4980811ba3241534b2e1dfc6c7f1cfae25b8bca908e77"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.22/lingtai-linux-x64"
      sha256 "8009ca3b9e736e0bfe33e753a21ce40c8a0d38f2d8c89ab6c72e4e6bc33c0a7a"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
