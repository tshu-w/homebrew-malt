class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.62.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.62.0/pi-darwin-arm64.tar.gz"
      sha256 "86e1e0c65df6a82ff5bbc5540952726d86124b8f6ea458c6440c7ba56585ea05"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.62.0/pi-darwin-x64.tar.gz"
      sha256 "d6f4c8ffc92b392089138ad21e5e0027f09946794c9b954c86047f83968aeab2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.62.0/pi-linux-arm64.tar.gz"
      sha256 "d0c4652564d928d3c711a20de5b6964f29350b87c02450d5abe1b2b28f317496"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.62.0/pi-linux-x64.tar.gz"
      sha256 "ebd457b17d572794371af2b764e5f2c9819b01b21f91dc77f0cc793bf0147e28"
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
