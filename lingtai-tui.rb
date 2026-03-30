class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.0"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.0/lingtai-darwin-arm64"
      sha256 "1bdac04fa78dae884e82ee2bdeb75a5cb97e2e9996b00fd3a8aa7e1d908f69c2"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.0/lingtai-darwin-x64"
      sha256 "c61f2b27d382a130ed6a054acb29d3d9d1c94d8b90728954587f15b4a339a76a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.0/lingtai-linux-arm64"
      sha256 "b1307d26c7284d7471a485250f8cad4568ba24d3e1baa68cd7c591a3d7cf8b38"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.0/lingtai-linux-x64"
      sha256 "80cc3f9f51c10b4ff51ecafb01a2b450587b4ce757426b877ff2f4005bc2161c"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
