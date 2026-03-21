class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.61.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.1/pi-darwin-arm64.tar.gz"
      sha256 "247d39e853ce89c66dc6bd55ef732615e9036aae3967e4dcdfd319bbd25384b0"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.1/pi-darwin-x64.tar.gz"
      sha256 "f70ed3281efbd4c6a577bf3ed5a96b4964134e1cc7f3808995cfbc759f408e8b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.1/pi-linux-arm64.tar.gz"
      sha256 "d379af56e11f2d26147c4ac9ab2c2d5080bbece4b17b988acf4cafaf35d54f8a"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.61.1/pi-linux-x64.tar.gz"
      sha256 "529aa1db32955055a7a5f3682099fea9f210486b710b0530a8e1628300ee23b9"
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
