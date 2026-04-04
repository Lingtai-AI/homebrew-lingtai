class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.27"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.27/lingtai-darwin-arm64.tar.gz"
      sha256 "f31402a6c7383508a7f4aa781dc1244817c9215eca926a52f59fc764fc87ab73"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.27/lingtai-darwin-x64.tar.gz"
      sha256 "eabb710fb08c737cda8bb91aeadda4caf43413ff0242ec59c15988c9126ef429"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.27/lingtai-linux-arm64.tar.gz"
      sha256 "fb4930bb9427f24a648a36d77ef29da8eb80625d4d6ed1b2f551ff26c9b4ea93"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.27/lingtai-linux-x64.tar.gz"
      sha256 "beef6fd8d58f5926a49b1db03f30a501584f2f729382f8ef1154f5f5eaf57c87"
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
