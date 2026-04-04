class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.25"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.25/lingtai-darwin-arm64.tar.gz"
      sha256 "2fdbf6c63ed4c1a3683909071a3cbc234db166d3c51a666a87824c53c3901b06"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.25/lingtai-darwin-x64.tar.gz"
      sha256 "14e73d1d306446267bd0bd6dc75128b45345524093ef2835d5941f956023fad6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.25/lingtai-linux-arm64.tar.gz"
      sha256 "21273e249423f92f0408affdd5bca73e597a1c1e75a5d1025cbc65309af35965"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.25/lingtai-linux-x64.tar.gz"
      sha256 "37c6d12cc7ebbdb8ea2acd3be6f5b47ba8ac1c80808e89703888357b7861e59f"
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
