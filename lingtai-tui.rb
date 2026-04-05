class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.30"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-darwin-arm64.tar.gz"
      sha256 "338a8d0c4e9f63095129e8b55023b7c49fb5eaf41107ccb94ab865accea08dcf"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-darwin-x64.tar.gz"
      sha256 "fa7592ec88087e828db946fe7e5f037d3e1e89b9376dc7a0aa1e611ab0f09393"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-linux-arm64.tar.gz"
      sha256 "83f8d9c592d447d72be9abee63ec791627fb3d995fb8b5c57abd9394949233d5"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.30/lingtai-linux-x64.tar.gz"
      sha256 "730867dee42fbb613356eae9fbf778bcf6161896b4573928b3237b27693da5fa"
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
