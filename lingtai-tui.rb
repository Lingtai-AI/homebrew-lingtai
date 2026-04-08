class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.36"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.36/lingtai-darwin-arm64.tar.gz"
      sha256 "6d23dd279ef913b9fc704e1bc255ad5a24fd6db786518be8cca1c014d3fc3355"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.36/lingtai-darwin-x64.tar.gz"
      sha256 "cf14e3cdfcf23270238e3211359fc73cc829555171a157881a25c55b1d6e208b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.36/lingtai-linux-arm64.tar.gz"
      sha256 "3ce7d7166a05e4742053d6cb101839c82258f4464e566e400d7b429d68e19da1"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.36/lingtai-linux-x64.tar.gz"
      sha256 "6d168919a691fbc3224b1c491205789a7158c75e6352d7beb9643e87407a3fce"
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
