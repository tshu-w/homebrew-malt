class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.60.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.60.0/pi-darwin-arm64.tar.gz"
      sha256 "08efe90fef4b3ec967ffb962916622b0e57b2ee5e539eb50031faf94c712eb05"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.60.0/pi-darwin-x64.tar.gz"
      sha256 "f4e7d6898041eb1d7f8f3d21e3fbad2b598de6551a03254a17f1ee09755e4d89"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.60.0/pi-linux-arm64.tar.gz"
      sha256 "cc41de0956abd34c66d4ab9d15c0104f6206be64818688a410b9d38165d7a812"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.60.0/pi-linux-x64.tar.gz"
      sha256 "10427f29efa513f8cdf76cbf5f510a5cb0af14a8f56b5eb6675166c6f8741496"
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
