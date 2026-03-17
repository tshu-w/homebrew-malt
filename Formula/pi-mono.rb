class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.58.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.4/pi-darwin-arm64.tar.gz"
      sha256 "e8a4b3a57dcd5c713446e10f4b278cfe22f351095bbf708e02ad95658bd06fd4"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.4/pi-darwin-x64.tar.gz"
      sha256 "5f2be24f873c8828ab69e03f70f60c49f5c2224ca63983afeab5b4a6aa81d8f1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.4/pi-linux-arm64.tar.gz"
      sha256 "4c485840a4ed4fef99fd6cc15cc30f4dcbc1e6a2b37063fed286f8031481e83e"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.4/pi-linux-x64.tar.gz"
      sha256 "58a85f1d97ec3f05d2fac20b81e2f3c2ae06920c9e536ca4dbbb01a69c5744a1"
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
