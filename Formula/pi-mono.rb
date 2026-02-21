class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.54.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.0/pi-darwin-arm64.tar.gz"
      sha256 "9b17d65c32ea75059d5556ee7862e4df75e7f8fb1ee1623bf6da20dbfba8a9f9"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.0/pi-darwin-x64.tar.gz"
      sha256 "5675694c87c1e2923c877e991f87105f4096186b86c367626970783234d38ac2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.0/pi-linux-arm64.tar.gz"
      sha256 "e5abcd57371dad6cb0af1092d9697a661d03d4e55411acfb1048d3988f500076"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.54.0/pi-linux-x64.tar.gz"
      sha256 "5f17551ed731cef3cbac51526aa6e77dc2f86db3239dfcb32b5a4f70c75b26f7"
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
