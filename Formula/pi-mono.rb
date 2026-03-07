class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.57.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.0/pi-darwin-arm64.tar.gz"
      sha256 "a1e7bdb8445d5ceceb88bb4a655fa4037a89dfc37a0b01019538ecc22dd10ec8"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.0/pi-darwin-x64.tar.gz"
      sha256 "267b670cf1b200a29e33db3528429ee80fdedf3d86886d6d2733e2a6d7ab2075"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.0/pi-linux-arm64.tar.gz"
      sha256 "82d7f2a794f3c7e2f4062f623ca541f00fed8c3334c1f0035f9a2f5dadc641d0"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.0/pi-linux-x64.tar.gz"
      sha256 "47763bbc3b71f96dbeafea87357cd7095897c56f0ed2b1d3c1d8637e53bf087b"
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
