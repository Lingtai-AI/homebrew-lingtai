class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.18"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.18/lingtai-darwin-arm64"
      sha256 "e81682826b3b918c080dafd1636af9b7983becdb986b6d1a93700817e2357eb1"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.18/lingtai-darwin-x64"
      sha256 "a058af13f86b5da3041461fa3e5d9ec4874b84367591557f007e9a0487e9ec53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.18/lingtai-linux-arm64"
      sha256 "7fdfe22e44e17eb5107488719c6c6431e68e9442aa2462b174d85164cc554817"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.18/lingtai-linux-x64"
      sha256 "43b6264a040fc41c67d7b9e920722d4d6d518551497d56d06ab6fe1937888601"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
