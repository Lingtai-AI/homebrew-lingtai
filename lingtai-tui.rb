class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.3.3"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.3/lingtai-darwin-arm64"
      sha256 "49f671d58f467f390753e700e0f26fc405c8e4c72d3c5d863bceb6cc5297ccd0"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.3/lingtai-darwin-x64"
      sha256 "92775cf5b891c03686be3485c676634ad07f5d4eca92a4f98dbcf33ed7652804"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.3/lingtai-linux-arm64"
      sha256 "93ef397cf1014cccc219ff216b3ebdf3772d95c5910ee752806ea95e6b533ebd"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.3/lingtai-linux-x64"
      sha256 "4b7f44174db82ed9a6d9fb9af60504318251da0ddcc962e6642f7a5547ccbf25"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
