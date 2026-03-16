class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.58.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.3/pi-darwin-arm64.tar.gz"
      sha256 "413705dfccef2481924cff6535ad6af9214f6554604e23f03620f7103ee818b9"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.3/pi-darwin-x64.tar.gz"
      sha256 "90d9d440a49c7182c5ba3dcf646a5aa717e944a25775f3b7c661eab657a4313e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.3/pi-linux-arm64.tar.gz"
      sha256 "705a6822e10ac242b8895968590499c1bfe67fdde11ea7e4df4bce69de96b441"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.3/pi-linux-x64.tar.gz"
      sha256 "3aad86669139353e7ebfbfe402cbaf58cafe519e568f8d85afb46c8b979ec748"
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
