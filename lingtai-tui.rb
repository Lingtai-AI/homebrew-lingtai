class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.38"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.38/lingtai-darwin-arm64.tar.gz"
      sha256 "a1065ad0ab99c1963cec88705658d1d456f366de91f228e8f562b80cb7c8091e"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.38/lingtai-darwin-x64.tar.gz"
      sha256 "4f3e036103c611530bced931d727a1d0a68bf05de7b69b812d51651f8f68b974"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.38/lingtai-linux-arm64.tar.gz"
      sha256 "1e4beac5a9ee0ca5f3e2a41906a29fb1966acd899dc0e76dfcf15b122803baec"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.38/lingtai-linux-x64.tar.gz"
      sha256 "ff501b00d4a692c0dc9e4d304fb03af0a68e07ecea15613e5c03d67f9b42886e"
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
