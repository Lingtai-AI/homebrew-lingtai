class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.40"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.40/lingtai-darwin-arm64.tar.gz"
      sha256 "0fa2e805fa3b3dc246061df1f9972924a2c3b01640b487a50e76c03532d5fffc"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.40/lingtai-darwin-x64.tar.gz"
      sha256 "827be3c7f44e8bfeefaaaa8fd098cb4b1a49a7d1be743d1f2483832b4026780b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.40/lingtai-linux-arm64.tar.gz"
      sha256 "25c78ee4f7bd99aa4c8b94f6c2b9f74319f74c0f4f2e4e1440e64f30b896b847"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.40/lingtai-linux-x64.tar.gz"
      sha256 "69abf918abe21a34e59fcd42f86d005964dabf6b7008187bf3ec5d5d1e7d6db8"
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
