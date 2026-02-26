class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.55.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.1/pi-darwin-arm64.tar.gz"
      sha256 "fbb90d4a8a747e6341cb6c2df2e607165bfb87447008baa5a1f5266345c961cc"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.1/pi-darwin-x64.tar.gz"
      sha256 "d279308901e7753c7beff43b6c95ee85a4959f03b7697cb45819027a1241a5a9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.1/pi-linux-arm64.tar.gz"
      sha256 "3cd296e8bbe6b78ca9f12cadd1372a8250c0d0d9ef72e8f17ea8970f7a50dfb3"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.1/pi-linux-x64.tar.gz"
      sha256 "7c55e6a0ba24295f10c704fd40bd060c382b6003d5f8c7931406fac2bb034983"
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
