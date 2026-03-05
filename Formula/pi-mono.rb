class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.56.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.1/pi-darwin-arm64.tar.gz"
      sha256 "fffde26ddcb9142214683f12b0034e7b8eafc36ef2f5ce4ef795caef8d7af997"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.1/pi-darwin-x64.tar.gz"
      sha256 "39c70a9757056fd238e4c7ba19da427f39db3cec52e491a57210366a27f48063"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.1/pi-linux-arm64.tar.gz"
      sha256 "2aa39af49067606b72f16b02250060c7868411ec2fe1326126cfaafe8377e066"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.1/pi-linux-x64.tar.gz"
      sha256 "31671400be26c9dc851ac22759e00b016099b1b3336af10bdbf49ebf5a1bf3f5"
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
