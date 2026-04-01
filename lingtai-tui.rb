class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.14"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.14/lingtai-darwin-arm64"
      sha256 "5ecf0ef505fdb3e97f357379e53f7c50339094ee17a919a0a456258cd19d256b"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.14/lingtai-darwin-x64"
      sha256 "4cb6f683332b09500a1f8dcb5de7b988f76fd9cb977dcfaeb790150e2e833732"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.14/lingtai-linux-arm64"
      sha256 "f88d7af247b2d2958c6996aeef73584200dfc962ff284ad58b5251c5c7ee8dcb"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.14/lingtai-linux-x64"
      sha256 "c27ff7b0559b7eaa718fea1f2b72f78860991ccbc20e2df4d826fce52f65d00e"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
