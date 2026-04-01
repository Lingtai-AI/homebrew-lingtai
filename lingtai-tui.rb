class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.16"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.16/lingtai-darwin-arm64"
      sha256 "f5eac1ae948d5125e89140f06e269fe556aab941e67e64616bc710d7fd3d4d1d"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.16/lingtai-darwin-x64"
      sha256 "943ea7f0ba4ba27d744c494c6fa441c15ad50c3dea4b122bcf65a5ec7c3bf625"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.16/lingtai-linux-arm64"
      sha256 "7d61f048c1ee2a856753620dc016f89b0be09dc0fd1466641d7116ea0f8ddfd7"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.16/lingtai-linux-x64"
      sha256 "11b7397b351ec167d050b501a2327415dc4c1554edc373b336f45981fa90b08a"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
