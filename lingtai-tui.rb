class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.9"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.9/lingtai-darwin-arm64"
      sha256 "c408a144d649a97b40b60d6f7c27914ccb60beca5e057857ba387cc86aaab071"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.9/lingtai-darwin-x64"
      sha256 "3c1fb79202e6fba267d9812e0602812930febf03640575900c4c6ec60fae9533"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.9/lingtai-linux-arm64"
      sha256 "50ef2dfbb11592183be8c6bb6692038a4379a8be37594191b5c7655d0e7569a2"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.9/lingtai-linux-x64"
      sha256 "ea475a5a645e3524d60d3876b8a24ef6b0388f483e1aade3875fdd9817b9c046"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
