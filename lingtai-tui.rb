class LingtaiTui < Formula
  desc "Terminal UI for the Lingtai AI agent framework"
  homepage "https://github.com/huangzesen/lingtai"
  version "0.4.42"
  license "MIT"

  depends_on "uv" => :recommended
  depends_on "python@3.13" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-arm64.tar.gz"
      sha256 "4de5daaf98b5f7316e0d14d508a017dacbf132e7c65f574ae78425c685e27e87"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-darwin-x64.tar.gz"
      sha256 "f38856ed841c1acbc81eb525aa609632ef5442195629f571ca0ca44e43bca610"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-arm64.tar.gz"
      sha256 "65e139e04977070b8cf3f52820602ed4d330caec4b5fa24cfd113b889e854d65"
    end
    on_intel do
      url "https://github.com/huangzesen/lingtai/releases/download/v0.4.42/lingtai-linux-x64.tar.gz"
      sha256 "1c7f36d92db98be9f6cd4c087fd70233e8ab9ab01ded2a8942af970ef9430b08"
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
