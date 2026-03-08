class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.57.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.1/pi-darwin-arm64.tar.gz"
      sha256 "4fc70b24a23e383b1c356ea37620e1189d688420df36b48c49b475789f5e0f8e"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.1/pi-darwin-x64.tar.gz"
      sha256 "bc67733ce9a5762d34ae608feb655ae77434f1f535aa08a65c6de4045b77ec73"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.1/pi-linux-arm64.tar.gz"
      sha256 "1ab5fbf0cbc410a68ce8c380106b6d7d6e2feabca0dca27b8e68b7770ea1f4ad"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.57.1/pi-linux-x64.tar.gz"
      sha256 "8214302855a2fa83d15b4706bc8e8be91a269aacb49614c14aa73fd2c2aa65a7"
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
