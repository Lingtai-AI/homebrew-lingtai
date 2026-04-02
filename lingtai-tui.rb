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
      sha256 "7d3926b80a82e4f964dd3006e5c50baafc17eaf3cc9b84eafea63454e357c6ce"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-darwin-x64.tar.gz"
      sha256 "a29d56bb4778d81c177b61b934f73cbbe6e9a52c54e971ad4cd1b10d3f6e4e35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-linux-arm64.tar.gz"
      sha256 "5e0d755f6f7d90279fc1a8a59083520855541440ef4baabb0564060d305f716e"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-linux-x64.tar.gz"
      sha256 "39d34544da411f59fa387bad59b50ed0fa030f559e1c7202070fdd299795196b"
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
