class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.7.1"
  license "MIT"

  url "https://github.com/huangzesen/lingtai/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "4bcf5cb343cc7799e5f168a932a729e4420d814410006fe7a650a882a11c7b9b"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  def install
    # Network mirror selection, in priority order:
    #   1. HOMEBREW_GOPROXY (explicit user override) — community convention,
    #      survives Homebrew's superenv scrub because of the HOMEBREW_ prefix.
    #   2. Auto-detect: probe a stable proxy.golang.org API endpoint with a
    #      3s timeout. If unreachable (typical on mainland China networks),
    #      fall back to CN-accessible mirrors for Go modules, the Go checksum
    #      database (sum.golang.google.cn is Google's own CN-reachable alias
    #      of sum.golang.org, required for CN builds to succeed), and npm.
    #   3. Otherwise: leave ENV untouched — users elsewhere see no difference.
    if ENV["HOMEBREW_GOPROXY"]
      ENV["GOPROXY"] = ENV["HOMEBREW_GOPROXY"]
    else
      proxy_reachable = quiet_system(
        "curl", "-sSfL", "--max-time", "3", "-o", "/dev/null",
        "https://proxy.golang.org/github.com/golang/go/@latest"
      )
      unless proxy_reachable
        opoo "proxy.golang.org unreachable; using China-friendly build mirrors."
        ENV["GOPROXY"]             = "https://goproxy.cn,direct"
        ENV["GOSUMDB"]             = "sum.golang.google.cn"
        ENV["NPM_CONFIG_REGISTRY"] = "https://registry.npmmirror.com"
      end
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
