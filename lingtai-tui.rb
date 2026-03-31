class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.3"
  license "MIT"

  depends_on "uv"
  depends_on "python@3.13"

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.3/lingtai-darwin-arm64"
      sha256 "e05fafa7b644d4890c976e6bf0ae94c4bc31740981da86609d410302a521a1c9"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.3/lingtai-darwin-x64"
      sha256 "974707c2d0580c8ba000feede4a5fe06167394b9ba5dcaf4d120524547e0091b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.3/lingtai-linux-arm64"
      sha256 "d065cbdecb04007b805aa20f2aadb133a0af583a1530fe2556ead66dd13ae3dc"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.3/lingtai-linux-x64"
      sha256 "20ea8d99320c72e45d100801db7e3c5b4531d08ebc5662a100f220aaca0e02c9"
    end
  end

  def install
    bin.install stable.url.split("/").last => "lingtai-tui"
  end

  test do
    assert_match "lingtai-tui", shell_output("#{bin}/lingtai-tui version 2>&1", 0)
  end
end
