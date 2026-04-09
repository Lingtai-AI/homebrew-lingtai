class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.37"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.37/lingtai-darwin-arm64.tar.gz"
      sha256 "7499ebcd9190994aa7571c601778443d2daa77aab6c3873799037b1e554e34fb"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.37/lingtai-darwin-x64.tar.gz"
      sha256 "f2ba7f7496972f83315af6431ea9ce1f5cf9bd389080e0681b57f6cef4603cc2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.37/lingtai-linux-arm64.tar.gz"
      sha256 "6d155287e42325e9d9ae85015566ca7cdac50799ab109223c41336c4fed4ccb5"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.37/lingtai-linux-x64.tar.gz"
      sha256 "91a3e79a3b0ff2f28792aefc274bda30e72bcab00616be8caaf6b36560f54101"
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
