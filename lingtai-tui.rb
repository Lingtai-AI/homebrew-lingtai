class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.6"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.6/lingtai-darwin-arm64"
      sha256 "c8fb35bc8e0615ecab1e4ab9bddc51e96b5047721653fa24ffdb5e8e1677422a"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.6/lingtai-darwin-x64"
      sha256 "b0e41262d9c74bcf1b95d32a5f2ff0bbb4177a610613b0ab6b1c6a140b7cb60b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.6/lingtai-linux-arm64"
      sha256 "6493504c5b8ea6517bf51c7ca7c92517054e24de81e4864d8647dd44f86b9def"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.6/lingtai-linux-x64"
      sha256 "cfc884769e5902fd80675cf7e5c3a48dee753adc2990399a93b873c27cc9dca1"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
