class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.28"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.28/lingtai-darwin-arm64.tar.gz"
      sha256 "7e26a16d3d81a44ac3a0c6507fee596010d26dc7571163895e13c703a6213260"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.28/lingtai-darwin-x64.tar.gz"
      sha256 "0ac1223c497b7c3b15c5145e6d9dd90a0bb6bec16cbeff6b45bde5325d5bd4e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.28/lingtai-linux-arm64.tar.gz"
      sha256 "044b64a539f672dc466671bd11c967d9b4d106bb9f5839a158d141926d931e46"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.28/lingtai-linux-x64.tar.gz"
      sha256 "b4c4c013b95664fdec80d2974107b2fe3615e2950bccab844eef661444a3f97b"
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
