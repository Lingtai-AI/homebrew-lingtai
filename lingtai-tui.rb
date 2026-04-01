class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.15"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.15/lingtai-darwin-arm64"
      sha256 "983845ffb712b7043918720f33c49e4f755cd95acab007d6ebf9ccf2e8c3ddbe"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.15/lingtai-darwin-x64"
      sha256 "635212ffbacc895841cd41c6a7302a0b7555c9d9d5066b3055d638a7d8a92a5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.15/lingtai-linux-arm64"
      sha256 "6462e1c4c6cf1387d4fc72af02f5df86c33e5ef88e42433dcd1e16c927fdf7ee"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.15/lingtai-linux-x64"
      sha256 "b167ab0fb0fb4463afbdabb1934c086f5970437c1226f08a06a4464a12e84516"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
