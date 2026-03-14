class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.58.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.1/pi-darwin-arm64.tar.gz"
      sha256 "100e851dc1710c0e5cc0ef1260ea0655897a6362de4f3283d313a9767ef4fb57"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.1/pi-darwin-x64.tar.gz"
      sha256 "a732c3f0a073d923e0604dcb29aecb35db8cdf2ab9955347dfb09d3657040f48"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.1/pi-linux-arm64.tar.gz"
      sha256 "c37ba791b6f7c52f8f4d4a0bc4ab8e92fa355ed1afa3650f0c31bd25a9bac1b0"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.1/pi-linux-x64.tar.gz"
      sha256 "0351101816df53f742977d437c95ce5077368b41bcbf6855e544635744ec110d"
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
