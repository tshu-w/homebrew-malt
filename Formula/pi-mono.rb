class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.61.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.0/pi-darwin-arm64.tar.gz"
      sha256 "743180a9ac6a5651e1df54ee6dc4c8596ad5a830ef891fd6b1b5a23ddb71baaf"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.0/pi-darwin-x64.tar.gz"
      sha256 "3d0c0d50df36fc9518cc41b2759701846729052bb2dffdf343cdc2c1b4304cdd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.0/pi-linux-arm64.tar.gz"
      sha256 "25973859ac18e395d60b6e4fb76ba50a9427f3dda29e4383bbb998a10ce08f59"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.0/pi-linux-x64.tar.gz"
      sha256 "02067d4fdc24bed92c954a52ffeefc2cffe79ce9c1c4ee139207d1f2eef12c09"
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
