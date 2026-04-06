class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.65.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.2/pi-darwin-arm64.tar.gz"
      sha256 "d3f53ec0c7108510b55743760e32ba6bdff85bf4f3d27decd559858e517dca0a"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.2/pi-darwin-x64.tar.gz"
      sha256 "20d90bdbf185451eeca2513f658c8576b917772b45246c90e70bedd517f0266f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.2/pi-linux-arm64.tar.gz"
      sha256 "19367666ed857cf7aa92736c9863958fe0b3cc8cb36c091273b5525002fac88b"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.65.2/pi-linux-x64.tar.gz"
      sha256 "54adf38cbc01d7b894c37922539239b84758b95883667005822e2d060fd93d82"
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
