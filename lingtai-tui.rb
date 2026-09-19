class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/Lingtai-AI/lingtai"
  version "1.0.9"
  license "Apache-2.0"

  url "https://github.com/Lingtai-AI/lingtai/releases/download/v1.0.9/lingtai-v1.0.9-source.tar.gz"
  sha256 "bc3310bbfd7cc5224ab3a91f6a2cda0707460da1e361e8600fd567d1dffa2054"

  depends_on "go" => :build
  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  def install
    cd "tui" do
      ldflags = "-X main.version=#{version}"
      system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"lingtai-tui", "."
    end
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
