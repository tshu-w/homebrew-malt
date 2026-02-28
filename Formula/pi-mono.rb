class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.55.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.3/pi-darwin-arm64.tar.gz"
      sha256 "1b95d52e64dc4bc1fcd759f140cafbdba89a327a8714939116fb61fd367ca21b"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.3/pi-darwin-x64.tar.gz"
      sha256 "fcb09882014a926f2d5c49cc08130c905b76219ad96c7cff688f6b818dc4ebf3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.3/pi-linux-arm64.tar.gz"
      sha256 "a7721099257965b28791092cd3aa344c210ee515486fa2c9895bead06e988e46"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.3/pi-linux-x64.tar.gz"
      sha256 "033f2a0df9cb93acbaebbff50db2ee7fae2749672b3cfe66a4eaa063bc8e3136"
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
