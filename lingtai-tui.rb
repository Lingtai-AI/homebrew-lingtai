class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.1"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.1/lingtai-darwin-arm64"
      sha256 "aa3cd1ea38f7e5f870b0f17ab0b27aa5ea28cc1ad1708ba5f1c581beb63b8264"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.1/lingtai-darwin-x64"
      sha256 "46e6151277798812c4c132df99262aa920240fdebd4eac5d492051241f6e6598"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.1/lingtai-linux-arm64"
      sha256 "4b2767b0d77df06a58e356336f904c3a72419ac0af74ce02deafbe13ebec9b2a"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.1/lingtai-linux-x64"
      sha256 "b1c6d5460a1145058a51172cf28d14c4b1d6d70fea36ddd23035c30652860ab7"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
