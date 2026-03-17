class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.59.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.59.0/pi-darwin-arm64.tar.gz"
      sha256 "7eb51e41eb8568c4405095a11abd170db6d1e5f4d8cada4e27c565ec65adaf00"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.59.0/pi-darwin-x64.tar.gz"
      sha256 "a8297803b373038cf955dae11475ba2b27cb2ec1cc057e62ead82ea0389b50df"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.59.0/pi-linux-arm64.tar.gz"
      sha256 "d4a6fd41f40fa87a5d481180639a9a630de91591fe73a3f7fc60ac3eb9ed3fb3"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.59.0/pi-linux-x64.tar.gz"
      sha256 "3cf021a6f3943c676a2d4de433522cca80cfcc529c7af142992088eba86cc5a8"
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
