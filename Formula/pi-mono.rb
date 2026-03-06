class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.56.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.3/pi-darwin-arm64.tar.gz"
      sha256 "36be13445af42b44e4fc6f3dcd1ef5e9ab53ce42c6814934c12291cb89b44034"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.3/pi-darwin-x64.tar.gz"
      sha256 "1d2fb11a156d5951da25b9464d3ddd534a72b48f1cf8d45eb02a606e791c1808"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.3/pi-linux-arm64.tar.gz"
      sha256 "111dd61b3142e441d79b48e9c1919e22167a57b74f8badec36b2e62ff343fa57"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.3/pi-linux-x64.tar.gz"
      sha256 "2b61eb623f4bf66cf276c56153bdcf8466be2bc9d68b0acef11cbcf5fa46c379"
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
