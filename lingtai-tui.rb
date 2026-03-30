class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-darwin-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-linux-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-linux-x64"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
