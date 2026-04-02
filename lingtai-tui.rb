class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.19"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-darwin-arm64.tar.gz"
      sha256 "7fb63f0a0d48e84fa1f621d147a259f220132d78c8078ccc02618eb778fc9dca"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-darwin-x64.tar.gz"
      sha256 "44ec227bf78c85cdf58d8285f93f4b8874955a22bdc28e732b9247c81c476903"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-linux-arm64.tar.gz"
      sha256 "3abaae2c2b8e8e7cc9379d3222da34b58dd679357a7f7cf9bd9b5cdf339eb95a"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-linux-x64.tar.gz"
      sha256 "8761fcab3a80572fc5cf93b5194e1cf75d9c9c4f111c143ed4872ac735bc2e2d"
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
