class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.5"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.5/lingtai-darwin-arm64"
      sha256 "0563fb7934b04fd43798f0c23d3aec2d9a377422fb6b18dec59202435c23fede"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.5/lingtai-darwin-x64"
      sha256 "806b6bc67446137042190d9181dc2de9d59c407b4ec774c439a98625a4294c01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.5/lingtai-linux-arm64"
      sha256 "606bf7ac014ce351dcc90803e5f7485bf487e15969a7e758c6afd8131d79d3b9"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.5/lingtai-linux-x64"
      sha256 "0bf3107f2e73545c22ddf0a2cd95c054a17c2f670336c1679999780ad94b0813"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
