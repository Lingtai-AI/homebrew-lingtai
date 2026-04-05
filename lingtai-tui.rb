class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.31"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.31/lingtai-darwin-arm64.tar.gz"
      sha256 "31c94305f65168aafab6f63196383b6d48ddea869696dc214bcd4fa803afc2ef"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.31/lingtai-darwin-x64.tar.gz"
      sha256 "76249815795129b2ad08dc4c5ee655ff5c70fa1b9421aa90294b0cdb10af37ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.31/lingtai-linux-arm64.tar.gz"
      sha256 "6c3cc998e6b45517f1df15134034006b40dc0fb0c60356fb99d94530177c7f6c"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.31/lingtai-linux-x64.tar.gz"
      sha256 "372bc828138a61c5cfb9d3a99f6b23c2c1db6ce3cceaf32ab42c7d2a64a236d5"
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
