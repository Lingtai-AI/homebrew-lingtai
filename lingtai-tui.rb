class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.4"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.4/lingtai-darwin-arm64"
      sha256 "6c8ee69d1335988e3a0b9f3c9fe13f6d1473c7a3b22f78a161c3e37c0f50ae62"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.4/lingtai-darwin-x64"
      sha256 "5ce404f6f8312892cd2f1ae048dc094a1eb5f14c73c9b8ab512b02071bbbefae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.4/lingtai-linux-arm64"
      sha256 "582c80a1cd85690cb6965374a753b9afa66f207fc22bcfd16bd745eab0ecfccc"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.4/lingtai-linux-x64"
      sha256 "fc6370b581e712a23176602851780700bb3979903dea91ddd07b783d265b08bb"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
