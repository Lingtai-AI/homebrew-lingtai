class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.30"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-darwin-arm64.tar.gz"
      sha256 "1986242ef5606336120a4df92f6df2156d3abb8f61a4183b2db392024b649a28"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-darwin-x64.tar.gz"
      sha256 "7b3b9d9ccaaa52e18f4ff59e0f0c6e6f22420cfdca15aabc86244eccf08b056a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-linux-arm64.tar.gz"
      sha256 "9623dee56792f4570f4c9f86b5c626505c3d99e685881598df98b8cbbdfde2c1"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-linux-x64.tar.gz"
      sha256 "d5c5e24fa1262ae04dc4ca086ca1c288933f935442fb65572f77c9d36068f49b"
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
