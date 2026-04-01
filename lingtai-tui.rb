class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.17"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.17/lingtai-darwin-arm64"
      sha256 "f6eda77a5355620f58bd864205486aee68286113d8c96c9806f931f9fa4751d4"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.17/lingtai-darwin-x64"
      sha256 "5a675d22c2a24710ce581b086f46dd2bed6e509450bfbf22243494119b31a0e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.17/lingtai-linux-arm64"
      sha256 "b2d595ad18c19ba97894f6fdc6f7626aa527c4908b092116bd81ef3b37421aef"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.17/lingtai-linux-x64"
      sha256 "705027f50fc95dc295863d57007161f4e8770ad24e1dd7b6fb9ad14a38d1faad"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
