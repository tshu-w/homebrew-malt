class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.55.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.0/pi-darwin-arm64.tar.gz"
      sha256 "9355acf26b6700db7c03dcd90cdd423a7849c58df11dc9206437679548f30bd9"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.0/pi-darwin-x64.tar.gz"
      sha256 "b8f88dce55c3c931df8854d68b0997fc02e4a904046a588d1ec2b8f15cbb8ee6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.0/pi-linux-arm64.tar.gz"
      sha256 "9ddfe51ce0c82758b23af81773cd4e091ca662b4a40fc8bbb3bc8d2209e9795c"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.55.0/pi-linux-x64.tar.gz"
      sha256 "2b47e8d7dd03baa5c22b5f5a5f550fdd3e6b4fd14b3d414e3018203130f4568a"
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
