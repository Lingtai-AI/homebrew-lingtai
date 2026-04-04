class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.26"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.26/lingtai-darwin-arm64.tar.gz"
      sha256 "ce2cabb9197e50fe38cc9a01204d1e1732040fda81ff63e166315f15e7dda0c2"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.26/lingtai-darwin-x64.tar.gz"
      sha256 "975e516a486a144df1527e8e5847960c643f8a16c1810062e2b85918b6360f44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.26/lingtai-linux-arm64.tar.gz"
      sha256 "de852adb4148a0018f32fda846f68a246a7571c3fa8873e4ad77027f1a96b559"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.26/lingtai-linux-x64.tar.gz"
      sha256 "b29e2f0cf63675df4e98493b644ab6a78d3d66d37e7602f1cddb693f1633b1a6"
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
