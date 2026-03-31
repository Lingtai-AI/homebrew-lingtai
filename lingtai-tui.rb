class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.7"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.7/lingtai-darwin-arm64"
      sha256 "b2efd1b7697c2c9fa2962e95bc783970d7fb3cf9d28cbc9945027ddad2b413fc"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.7/lingtai-darwin-x64"
      sha256 "f866ba4d86d612168133bede2038b236fd89bee5756bd4b21f94b3c6e5bf8989"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.7/lingtai-linux-arm64"
      sha256 "df9f32aa4ccf0d1d065de402fce8eb5f8ad403f19dd54e2654e46c98777863f2"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.7/lingtai-linux-x64"
      sha256 "ff142876f1862339c031bce6ab86e4495f81c695151c908321379e192b4fd827"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
