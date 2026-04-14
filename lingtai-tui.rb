class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.42"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-arm64.tar.gz"
      sha256 "a96cbfd61ff7cdde1a2b72799332db48010f74f6dff9d329408cdc301d1683f5"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-x64.tar.gz"
      sha256 "c571e1f622f7f66018271f88e3aef2566c4d04bffab52c02f4fa6513889342f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-arm64.tar.gz"
      sha256 "9bd8a6493a571e87ac343e67842f7050863fb463afd2d051e4b3524e32c9e9d5"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-x64.tar.gz"
      sha256 "872cf71063c14817845ae678b33bf55ffed6d305299d67b46e6c584a196e28fb"
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
