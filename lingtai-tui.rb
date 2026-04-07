class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.35"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.35/lingtai-darwin-arm64.tar.gz"
      sha256 "451b7294d63ef392beeedac9c21ef98c1509811f0504bdc5f4e3568ee4576467"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.35/lingtai-darwin-x64.tar.gz"
      sha256 "9b57990674c9a36c28e7c05f15ff3799b516c8ce414e3109ad884fcdd55baa49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.35/lingtai-linux-arm64.tar.gz"
      sha256 "1a3d54b1e8af75252db0cc8570571b26f708d4a61a2e7796daa3011390f288c4"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.35/lingtai-linux-x64.tar.gz"
      sha256 "5a09b44e7912c9219371aaa0b8afeff1a91c93e4db1b5d70bfc1a43a67d47bda"
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
