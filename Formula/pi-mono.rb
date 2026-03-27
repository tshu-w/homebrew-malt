class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.63.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.1/pi-darwin-arm64.tar.gz"
      sha256 "656e547e758897209d3c8943f5e5132a59f1ec08b722f05d91c81e2d6d1bbe0a"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.1/pi-darwin-x64.tar.gz"
      sha256 "90904d9b1a907cd164781f476fe463cc3248d1abf6fdb0708fba4ed7ac91c057"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.1/pi-linux-arm64.tar.gz"
      sha256 "879b1966394aef22d23fb542b553a4dfa8ae825ac2b5b36dccea253f33b9896c"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.1/pi-linux-x64.tar.gz"
      sha256 "a30d0a2fb6fc281857c88eabb13a3c2a57678d0c6f7598d64110cd5ead335f88"
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
