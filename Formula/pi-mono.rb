class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.54.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.2/pi-darwin-arm64.tar.gz"
      sha256 "2f4a7e0f0e4cae090444f3d6124ef6c18768ed08f0d5987eecd66352f1522268"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.2/pi-darwin-x64.tar.gz"
      sha256 "bf2acb248dea9aae87658af84fbeafae1e8e6c00812047ab3dafa9d649a48527"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.2/pi-linux-arm64.tar.gz"
      sha256 "1cd3075f4f090da681635c08f115d2a744f3cc0cf1a326f1b3a4e9eae605b29b"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.2/pi-linux-x64.tar.gz"
      sha256 "98682fbadca615b60a4ee951e2e0544449cdf4111d46066195c8982919f3f9e5"
    end
  end

  def install
    libexec.install Dir["*"]
    executable = (libexec/"pi").directory? ? (libexec/"pi/pi") : (libexec/"pi")
    bin.install_symlink executable => "pi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pi --version")
  end
end
