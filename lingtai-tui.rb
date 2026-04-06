class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.33"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.33/lingtai-darwin-arm64.tar.gz"
      sha256 "c6b77ea9dd15102952d03e90fb27c5c750d5b9c88fd177b7f9983398a3feb820"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.33/lingtai-darwin-x64.tar.gz"
      sha256 "2adba21c99159a6559c7f78fdb3a26e46a29a81238a0987559bc42715f2e7ac9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.33/lingtai-linux-arm64.tar.gz"
      sha256 "06d33ec7a9b969f24e62e4f59d42680f822d0e6c6faff085991971edebb7af15"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.33/lingtai-linux-x64.tar.gz"
      sha256 "ad44f12be41f28b7ae8b6de9a899cbdaa391a18a0bdbefbf87ff89d8ec7a4282"
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
