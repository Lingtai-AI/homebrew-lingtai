class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.39"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.39/lingtai-darwin-arm64.tar.gz"
      sha256 "81a4502f08ccf21bac08d8457667f536cc56780db7682fafc8a511f7941d1761"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.39/lingtai-darwin-x64.tar.gz"
      sha256 "32a82460a40c737a80b8d835ea5ffa82fbe057198ab2b8ccdd870252fb1c2115"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.39/lingtai-linux-arm64.tar.gz"
      sha256 "acfb2a962ea6a69aa414a6b5f5af0f87e4d0fc3c856379676f73bae4de0fd26f"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.39/lingtai-linux-x64.tar.gz"
      sha256 "c0be0740ed8fd25bd8304501b1e872f3cdf43002dd42b2a1b5149d2835d76d52"
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
