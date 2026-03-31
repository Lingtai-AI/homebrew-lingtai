class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.8"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.8/lingtai-darwin-arm64"
      sha256 "89cccf73aa77e374cfb9c1ad34568967e87ede6c43067e3cad07a215b13877d7"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.8/lingtai-darwin-x64"
      sha256 "262a7c8297355633a0dba4c85bcdbe4d752b7bdf5b48fd4cddc4e5bbe7785c0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.8/lingtai-linux-arm64"
      sha256 "a2268cd98a5740c0bd19be96605805dec30b21e4d930124fce1144017be29d0d"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.8/lingtai-linux-x64"
      sha256 "4ab6494bf93d5380110e6ef06055545b5b43de6eeafd6828766923105ae1a85d"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
