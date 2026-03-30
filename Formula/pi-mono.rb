class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.64.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.64.0/pi-darwin-arm64.tar.gz"
      sha256 "db9c3858c1c26cc05ce685404b52e60980e7850c0b8ea20865dafad3effa4754"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.64.0/pi-darwin-x64.tar.gz"
      sha256 "35360535ccdf2403222483a6552e6400c5828994be10945bc6e43dae801c5eb6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.64.0/pi-linux-arm64.tar.gz"
      sha256 "ca5c9269a7a3ca5d0d677b45338b163c5fba8f07ad11765b946b0e7b0e1c0d96"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.64.0/pi-linux-x64.tar.gz"
      sha256 "65ff76b5f96bf6c7eea49f47b036fcf5e3a1de0c0d43735d7669e904833c3fc2"
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
