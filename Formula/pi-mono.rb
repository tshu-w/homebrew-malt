class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.58.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.0/pi-darwin-arm64.tar.gz"
      sha256 "9e516cf134bcf463f88323626a72bb06db8c3a27d56a294d61c729758b464434"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.0/pi-darwin-x64.tar.gz"
      sha256 "87f949851478308c124bcfc5999b2930dc299624b39163c0dcc242456a0cc5c6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.0/pi-linux-arm64.tar.gz"
      sha256 "abac19cb016b3db73ce5f511e46fe0c76297e8900edd85700c4f1a29a061dd2d"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.58.0/pi-linux-x64.tar.gz"
      sha256 "432f72fc6647858b3ea008efb31665c8075d6553ac035489843b3ae8f8ec6029"
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
