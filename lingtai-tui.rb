class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/Lingtai-AI/lingtai"
  version "1.0.11"
  license "Apache-2.0"

  url "https://github.com/Lingtai-AI/lingtai/releases/download/v1.0.11/lingtai-v1.0.11-source.tar.gz"
  sha256 "0544b47ca01c142dbb479001341770b1c9c7b135c5f097c2263dd66abe822c8d"

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
