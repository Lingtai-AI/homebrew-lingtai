class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.32"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.32/lingtai-darwin-arm64.tar.gz"
      sha256 "068c687f797ca6e98fda74a86065fc77f658567a3ba3bd92bed7e6c8a7e6386a"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.32/lingtai-darwin-x64.tar.gz"
      sha256 "dd1264ef86551ae2190dcfea24929493aae6d9add01e26275a94dd2920bb27ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.32/lingtai-linux-arm64.tar.gz"
      sha256 "97519eeee4890d6beb628fa41d1e0597b0d7c33d00e43237da7aefb5aa656607"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.32/lingtai-linux-x64.tar.gz"
      sha256 "dcab2764e511bad3856daf4078f6730d5b78b6b4ae174061e47f4d4553257864"
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
