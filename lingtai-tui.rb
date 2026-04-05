class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.29"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-darwin-arm64.tar.gz"
      sha256 "13a266f787103bd6624a90a6f3b05c33840b371eca0c233063b1e564a054842e"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-darwin-x64.tar.gz"
      sha256 "76caf786c8d5d7e2a18fcbc65d5023b0c2d2ce338df61d89a0f86f1818256061"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-linux-arm64.tar.gz"
      sha256 "820716d3b78d5f752d40378c30ed73b82422619d987909756ca131fd172ab31c"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-linux-x64.tar.gz"
      sha256 "1055b619c804357901a50ffb83cac696dd59a6a284349a83d45efc1a1a784922"
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
