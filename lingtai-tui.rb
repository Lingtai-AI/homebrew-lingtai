class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.29"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-darwin-arm64.tar.gz"
      sha256 "13d019eb24d261d6a3764db3ebeb40e2b7c7b1b3c8828d6b8642673b84c576fb"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-darwin-x64.tar.gz"
      sha256 "7b6438f7d07b7d386d99bb549af5ade2578107e1040275ae6df9204f225c84fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-linux-arm64.tar.gz"
      sha256 "c5bf81a5396ed765465dc4361484278ab97b91d858014d427722b4e2a0d58e62"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-linux-x64.tar.gz"
      sha256 "13d727d2e895a46d4d88fb592c7cc2b86c73632a8abdd3572b7bf003fe3e575f"
    end
  end

  def install
    bin.install "lingtai-tui"
    bin.install "lingtai-portal"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
