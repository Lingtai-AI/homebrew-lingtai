class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.11"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.11/lingtai-darwin-arm64"
      sha256 "bd22e2de1e170cdd637506588e6fcb0ded29972f4c460bba4f4e00e4a5da6322"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.11/lingtai-darwin-x64"
      sha256 "88f34f6a21a33fe54ec55d304ff42b8c7ceff3634869787aeea5654ddda0c246"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.11/lingtai-linux-arm64"
      sha256 "208b5f18113561e97022b12231532400bb3debc2beaba9ab859b49b5dbef8a7e"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.11/lingtai-linux-x64"
      sha256 "6574a02b6a1f7f2d218a18be117b6d5dd871b0649cf46199b63bd465e5e3f021"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
