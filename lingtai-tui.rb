class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.13"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.13/lingtai-darwin-arm64"
      sha256 "6e5c5bdd23b1a2c57b330cb63fee7df028465d69b2b8b6517462ed3c621dc364"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.13/lingtai-darwin-x64"
      sha256 "eab79c450dbf8c8eda47d581cb450f950aa7bf7fd686972a088d512ba72e7c1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.13/lingtai-linux-arm64"
      sha256 "91858ebb39d2d33e7874329b5ebf605ed9d4fe777ed4cf80ea0c1c40176919a3"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.13/lingtai-linux-x64"
      sha256 "eda566b1b3364fab9c1bc75556c3c597065d22c3075c03ba594fc80dcb20cc15"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
