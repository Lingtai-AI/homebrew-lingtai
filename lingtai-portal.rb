class LingtaiPortal < Formula
  desc "Web dashboard for visualizing Lingtai AI agent networks"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-portal-darwin-arm64"
      sha256 "9aeebcdbc0939805f3b879fade91f166f1a6f7efb0a3ee12f6c7cb1cc936c993"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-portal-darwin-x64"
      sha256 "1a01ccae10501b3b188ef5fcfcdc041f402161c62de4a910ed268551dd118bea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-portal-linux-arm64"
      sha256 "98696e0928639eef9b8d24d06c1c5836b62c549058133a01f320cc3e33677732"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.19/lingtai-portal-linux-x64"
      sha256 "5136d133448d4ff75803895e3e67b2d0b750c4dcf03bd2aa22a71574786399ee"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-portal"
  end

  test do
    assert_match "lingtai-portal", shell_output("#{bin}/lingtai-portal --help 2>&1", 0)
  end
end
