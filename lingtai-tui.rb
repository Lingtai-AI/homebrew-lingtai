class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.34"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.34/lingtai-darwin-arm64.tar.gz"
      sha256 "383d3bec52a161d449c7805f9d770ac1c0ababb362382a61fa30cb8417b24bb5"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.34/lingtai-darwin-x64.tar.gz"
      sha256 "3b6128ddda31e120f6142227fc5b668beb1d5c5cc856c41ebdc589b23c5143f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.34/lingtai-linux-arm64.tar.gz"
      sha256 "79943ba185cd382d55362aa55fa47ac9db3219421080a662acbe3dcb6be9523c"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.34/lingtai-linux-x64.tar.gz"
      sha256 "679e2c53eb8d531ede247e5cc9775ad09d31cbc7aa5be944f2e6f7a22a5edb04"
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
