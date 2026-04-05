class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.29"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-darwin-arm64.tar.gz"
      sha256 "bd5682b0b4c65d910f30bde01f22d83b4933734aa8b50cf56918bada556dbe34"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-darwin-x64.tar.gz"
      sha256 "5356d95f7b2410f0e3a5d3e7bfbed4236ea88e66e5b363f543ecb4a418373f7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-linux-arm64.tar.gz"
      sha256 "525c96192d8160a9f8ee661e75ec9d7acdca32eabfaa4632cc0ddff539578707"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.29/lingtai-linux-x64.tar.gz"
      sha256 "930de23514089c323890a86121de676a0c00c4a1a66bc3f55d46063ead91bf01"
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
