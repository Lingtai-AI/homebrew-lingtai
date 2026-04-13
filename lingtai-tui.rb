class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.41"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.41/lingtai-darwin-arm64.tar.gz"
      sha256 "bbcdd68b6a4c5f3ed3bbfa0be9b91d0ff67a5acf7e7c220448ae8ae912a234cb"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.41/lingtai-darwin-x64.tar.gz"
      sha256 "a75f085c6936fdf2ab5026b473c59ccecf932c5e0cee2a8a4362316d971371c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.41/lingtai-linux-arm64.tar.gz"
      sha256 "d8c36e6d94587149f47f1b70a601690f36bba0474b56087561a66b1ba7434292"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.41/lingtai-linux-x64.tar.gz"
      sha256 "56484acb46694a9178c403bbfde902cdc205703d25a9e32924508df6e7e59ab0"
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
