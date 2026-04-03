class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.24"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.24/lingtai-darwin-arm64"
      sha256 "99892d0863db7b053b3e9c02420f1418674bcc3d2f470205f8c74f5859fd7910"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.24/lingtai-darwin-x64"
      sha256 "f9abbe34a47358790b50eaf01913f1dc1e309256359e67885e5e751a346079ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.24/lingtai-linux-arm64"
      sha256 "79fb5878cf0ef7c88f3da8e4d1f0da1e1f3408420ea9cef1d6eac8dcbcd6789c"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.24/lingtai-linux-x64"
      sha256 "c36dd603c9544a4c7bfae477cfed36b1011cf33cee4bdcb9792d9f667c6210dd"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
