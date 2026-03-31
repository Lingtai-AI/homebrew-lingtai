class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.10"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.10/lingtai-darwin-arm64"
      sha256 "349b4e1e67bb035834c515a483d7de374d9b3686ecf501d0ab1809473f95527b"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.10/lingtai-darwin-x64"
      sha256 "7f03f89982fa79c044587eaf6717491160b18ddcfd4ea5649f6d93aee58f7efc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.10/lingtai-linux-arm64"
      sha256 "92113e182aa70daaed21b66eb912d921b21533af02398ad65a61f7e84867dff6"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.10/lingtai-linux-x64"
      sha256 "7a27ea21bb322ddf429f66f3ad0b53a78c9e1480405825e8b27aa2c63928d7f9"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
