class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.42"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-arm64.tar.gz"
      sha256 "e6dc14b1351acfdc6503fde37b59d9f63135a7d4b11d1e67eac5172f593f8ec0"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-x64.tar.gz"
      sha256 "8c426fa654073f0741a878f0634135661c78c204eb461803ff81fb4b25800291"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-arm64.tar.gz"
      sha256 "59d224f9d2855dbd13ae060f78d54a3c3d9d3db64fb0f533fdffbe5dc9b8bea3"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-x64.tar.gz"
      sha256 "720ac7eac03c6f837213e0233ead1e2f98c0a9fc22aeb34c04bee54d38a47147"
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
