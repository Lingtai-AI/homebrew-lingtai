class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.2"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.2/lingtai-darwin-arm64"
      sha256 "3108967aa5173c680239a8e064d660effa6412f6ed97ffc63153676fa08e553c"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.2/lingtai-darwin-x64"
      sha256 "098f332f61d1ff8363b180dd4375593f2099501f7e10ef899f8e7d3c1715134a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.2/lingtai-linux-arm64"
      sha256 "b81a0fdf79665c2b324c42a92430ee25556b7190ec2a129364aced1bb91bafad"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.2/lingtai-linux-x64"
      sha256 "02c5c86c09d509fa313b6f8e38e2116079b0ad0fe2f558bb2a0157b1f470b216"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
