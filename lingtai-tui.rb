class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.3.2"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.2/lingtai-darwin-arm64"
      sha256 "95301822de3d8b4750bfa38c83df39eeaa4b26724ce89f5aec7e7c9c2f40ad56"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.2/lingtai-darwin-x64"
      sha256 "6aa81069297b51b603110af51aa644487e4043c6fab08a4c8431aaf445e6b486"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.2/lingtai-linux-arm64"
      sha256 "ec08d780fa176ef5616c42756eb67fe1012804ba63ec2532c44048a2f13dd606"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.2/lingtai-linux-x64"
      sha256 "0c8bddfdde93dc209ba56fefa5294364588f1a8a97a6cca3faf3769be095585b"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
