class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.3.1"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.1/lingtai-darwin-arm64"
      sha256 "062f2053a0714d4b48164ec5e74f1d16e1702ae2fe1bf827e22dcc5d8d74b2c6"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.1/lingtai-darwin-x64"
      sha256 "1a79b9a1a081aa88c5b9bf5188f638ec78a38dd23c3b8a008a1d4b28d23b1acc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.1/lingtai-linux-arm64"
      sha256 "81c0881af82dcd3b5d31ce22b4405b1406616823596d01a5bd5df504331aa42b"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.1/lingtai-linux-x64"
      sha256 "4def082c5f47de48de09373d2db4a429820bda4cb5f19581e1a7a2f0cdae69f0"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
