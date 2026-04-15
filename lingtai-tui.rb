class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.5.0"
  license "MIT"

  url "https://github.com/huangzesen/lingtai/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d06442a4229c64fa7f7b3876eb8aff59160713758cda6189e496bfec1f386607"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  def install
    # Auto-detect whether proxy.golang.org is reachable. If not (typical on
    # mainland China networks), fall back to CN-accessible mirrors for both
    # Go modules and npm packages. Users elsewhere see no difference — the
    # probe succeeds in <1s and ENV is left untouched.
    proxy_reachable = quiet_system(
      "curl", "-sSf", "--max-time", "3", "-o", "/dev/null",
      "https://proxy.golang.org"
    )

    unless proxy_reachable
      opoo "proxy.golang.org unreachable; using China-friendly build mirrors."
      ENV["GOPROXY"]             = "https://goproxy.cn,direct"
      ENV["GOSUMDB"]             = "sum.golang.google.cn"
      ENV["NPM_CONFIG_REGISTRY"] = "https://registry.npmmirror.com"
    end

    cd "tui" do
      ldflags = "-X main.version=#{version}"
      system "go", "build", *std_go_args(ldflags: ldflags), "-o", bin/"lingtai-tui", "."
    end

    cd "portal" do
      cd "web" do
        system "npm", "ci"
        system "npm", "run", "build"
      end
      ldflags = "-X main.version=#{version}"
      system "go", "build", *std_go_args(ldflags: ldflags), "-o", bin/"lingtai-portal", "."
    end
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
