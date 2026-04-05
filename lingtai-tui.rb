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
      sha256 "f4e33189a90f6a5b62d71a6b1cb32fc685ce946fa6242b6dd450a501204ff614"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-darwin-x64.tar.gz"
      sha256 "97313b567a19c1e45adcc83058bfe77654c1783aa4f0994996cfee467ce4e4d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-linux-arm64.tar.gz"
      sha256 "0290d226f431ddd39e6e54a1e56ae322f4da1f19c7a1dc0bb14c9aa9ac9f9d0f"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-linux-x64.tar.gz"
      sha256 "167d559b0fd2552e116ac320ed7840e2f4610c12a0b734c09cc60dce3b50c628"
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
