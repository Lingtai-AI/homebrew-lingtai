class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.12"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.12/lingtai-darwin-arm64"
      sha256 "d7448296dc4f104dea8b7da4e5a558d8a629c154b43d54707c0bcdbde4612466"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.12/lingtai-darwin-x64"
      sha256 "4cdb9722b35a6bb5123564a46f318cdf9148cdeae1b462a0035cb518bc2e64c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.12/lingtai-linux-arm64"
      sha256 "f366a7254dd97d9676a9473592bdbc06978149e262fec3b051a3a372272bb666"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.12/lingtai-linux-x64"
      sha256 "f9e38d4f69a1435a811e662830980824de0e35058085de36416021e2d70c6fae"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
