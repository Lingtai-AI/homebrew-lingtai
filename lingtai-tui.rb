class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/Lingtai-AI/lingtai"
  version "0.9.1"
  license "MIT"

  url "https://github.com/Lingtai-AI/lingtai/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "b78927bea68531d6ed76a74f50f426bc660c6074506cc2c9950cbb1ae48e6969"

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  def install
    # Go module mirror selection, in priority order:
    #   1. HOMEBREW_GOPROXY (explicit user override) — community convention,
    #      survives Homebrew's superenv scrub because of the HOMEBREW_ prefix.
    #   2. Auto-detect: probe a stable proxy.golang.org API endpoint with a
    #      3s timeout. If unreachable (typical on mainland China networks),
    #      fall back to CN-accessible mirrors for Go modules and the Go
    #      checksum database (sum.golang.google.cn is Google's own
    #      CN-reachable alias of sum.golang.org, required for CN builds).
    #   3. Otherwise: leave ENV untouched — users elsewhere see no difference.
    proxy_reachable = true
    if ENV["HOMEBREW_GOPROXY"]
      ENV["GOPROXY"] = ENV["HOMEBREW_GOPROXY"]
    else
      proxy_reachable = quiet_system(
        "curl", "-sSfL", "--max-time", "3", "-o", "/dev/null",
        "https://proxy.golang.org/github.com/golang/go/@latest"
      )
      unless proxy_reachable
        opoo "proxy.golang.org unreachable; using China-friendly Go mirrors."
        ENV["GOPROXY"] = "https://goproxy.cn,direct"
        ENV["GOSUMDB"] = "sum.golang.google.cn"
      end
    end

    # npm registry selection — kept independent of the Go proxy probe, since a
    # mirror that is reachable is not necessarily TLS-trustworthy in the build
    # environment (e.g. UNABLE_TO_GET_ISSUER_CERT_LOCALLY against npmmirror).
    #   1. HOMEBREW_NPM_CONFIG_REGISTRY (explicit user override).
    #   2. Auto-use registry.npmmirror.com only if an npm client probe succeeds;
    #      this exercises the same Node/npm TLS trust store that `npm ci` will
    #      use. Otherwise warn and leave npm's registry unchanged.
    if ENV["HOMEBREW_NPM_CONFIG_REGISTRY"]
      ENV["NPM_CONFIG_REGISTRY"] = ENV["HOMEBREW_NPM_CONFIG_REGISTRY"]
    elsif !proxy_reachable
      npmmirror_ok = quiet_system(
        "npm", "ping", "--registry=https://registry.npmmirror.com",
        "--fetch-timeout=3000", "--fetch-retries=0"
      )
      if npmmirror_ok
        opoo "Using China-friendly npm mirror registry.npmmirror.com."
        ENV["NPM_CONFIG_REGISTRY"] = "https://registry.npmmirror.com"
      else
        opoo "registry.npmmirror.com failed npm's connectivity/TLS probe; leaving npm registry unchanged."
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
