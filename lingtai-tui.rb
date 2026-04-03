class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.23"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.23/lingtai-darwin-arm64"
      sha256 "b16f4e9367b8cfca0d9aa147e873b144fe8300aac2d86b36e5f314d7ec433b73"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.23/lingtai-darwin-x64"
      sha256 "c4c4c1ad3ace84c0dd59763c9c9e369bbaeed1ab3dbd57be2fd07b659014774d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.23/lingtai-linux-arm64"
      sha256 "93ca495765121e02dedab217b21930a34c28399f4690258a2e1e42162ee520a6"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.23/lingtai-linux-x64"
      sha256 "df7d5c4297e7501181754c0ed58debf19ba6140fca3f80834742de611557b0ce"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
