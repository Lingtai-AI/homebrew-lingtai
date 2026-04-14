class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.43"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.43/lingtai-darwin-arm64.tar.gz"
      sha256 "fc1ffb624f569a8e1caeab818ab83d7e6f0e26b0fdfb731d0a5fd854c7abdd15"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.43/lingtai-darwin-x64.tar.gz"
      sha256 "4ac92568f1995565fbd555dc694a0c62034aa6f5eaab2c5c74190389b8085010"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.43/lingtai-linux-arm64.tar.gz"
      sha256 "95f17507038df84fddf0a8a7fb6b076dd3948dadd04c046f91d4259f038091e1"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.43/lingtai-linux-x64.tar.gz"
      sha256 "cc64bc14831eb9bffc7c6b3fa0bf03bf0c1fd3e7bc73ff5e808f23277ae5300f"
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
