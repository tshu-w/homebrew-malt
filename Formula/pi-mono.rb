class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.65.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.0/pi-darwin-arm64.tar.gz"
      sha256 "ea1859be851705dc52f8823840dab3d1eb2b613d4b39765ba8e8470667780a93"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.0/pi-darwin-x64.tar.gz"
      sha256 "8fcb704223ba230c20ce514814b4882d884adfcadf82817a1ca2402eca883081"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.0/pi-linux-arm64.tar.gz"
      sha256 "594bd98c3a611872bc6da5ed4956e8904295c5a5e326e1803d62613030bbcc2a"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.0/pi-linux-x64.tar.gz"
      sha256 "ad38c11fb6097c96eaf1e753fed7b79eb424711ff989071e773f9a8ab909e75b"
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
