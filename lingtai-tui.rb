class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.19"
  license "MIT"

  depends_on "huangzesen/lingtai/lingtai-portal"
  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-darwin-arm64"
      sha256 "29001358e1e203c44fdd40193620ca7fbe992c7800bb65b9b4caf4a7c5183313"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-darwin-x64"
      sha256 "5ea9c17261912826a6ddd8e6ef9853e2517f53593d5012029467287cc0cbd8d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-linux-arm64"
      sha256 "bb0d29d832e9e7d6f2ed1a334ba60b6bb4fe4f33e8ff898a07ef87e5b7310701"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-linux-x64"
      sha256 "5cf8631fdd33b9c04207fb448801f08f72e0e95572abaf5d8d334f6268a1f490"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
