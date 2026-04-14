class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  url "https://github.com/huangzesen/lingtai/archive/refs/tags/v0.4.42.tar.gz"
  sha256 "67fb8fb5ea82053716dfe753b7e555fb315d2448cade02e2b0f3ba241c581df9"
  license "MIT"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  def install
    # Build TUI
    cd "tui" do
      system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "-o", bin/"lingtai-tui", "."
    end

    # Build Portal (web frontend + Go server)
    cd "portal/web" do
      system "npm", "install"
      system "npm", "run", "build"
    end
    cd "portal" do
      system "go", "build", "-o", bin/"lingtai-portal", "."
    end
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
