class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-darwin-arm64"
      sha256 "15e401311fbe04a2a9d42925eb3118b60001b79b14e8a7b5cccd9f51cd60bafe"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-darwin-x64"
      sha256 "ef88292f01662f7f3632cacef09ec74947eaf8fa73efd93699ce1bc9ede0f3dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-linux-arm64"
      sha256 "d71c9a89052a80de84cb29c3982d30bf7a14f6f7bb897d73c3331aa9c7036e8c"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.3.0/lingtai-linux-x64"
      sha256 "5318509535fdb8e01dac69007dc462b9c790239b4caf1965326c8bcca2f69443"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
