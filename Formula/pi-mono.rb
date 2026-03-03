class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.55.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.4/pi-darwin-arm64.tar.gz"
      sha256 "854e87ea85bb8a5dd360247a082f4575e84ce789c04873cd9cfadb9d5dda4a6f"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.4/pi-darwin-x64.tar.gz"
      sha256 "20efcddfc07a4d242af4e22158ab163f9e2a9d215bec77d70a9cc7a8e1cee78c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.4/pi-linux-arm64.tar.gz"
      sha256 "5e7214d0d7c2a76974dbf00c50ab1fe5da13130afb3a990a9b8050f9e019d701"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.4/pi-linux-x64.tar.gz"
      sha256 "ad06e623ddc9810f69031b025d63bfcb804fc98e0c7aecb9f9ce15eca6e5cef2"
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
