class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.42"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-arm64.tar.gz"
      sha256 "52ab184e64e37910de535955d8d7535abe228fccc458a9d2525b4b32391de6ef"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-x64.tar.gz"
      sha256 "4090efdccf047f245156664f4ad241be4babc890fef19f380d7bfc188b8ca048"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-arm64.tar.gz"
      sha256 "9e6be8c577760af1c7fc7732fecb31eab523036f8fca730f3720dca19cd5c957"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-x64.tar.gz"
      sha256 "48a9478dc5ada56edc7339b0bde3845f7b731bc8740407876f9ec5e6f553a831"
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
