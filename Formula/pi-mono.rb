class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.56.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.2/pi-darwin-arm64.tar.gz"
      sha256 "f8f7908d7a771479e87d5a266d3895776f390d3e707402c28bd698fa14bc6e6c"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.2/pi-darwin-x64.tar.gz"
      sha256 "85f9ce12c6b78576442451125741b614291dd3b634433d55d13d8b526c7cb213"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.2/pi-linux-arm64.tar.gz"
      sha256 "158f1b464d99b165e6f08dedb34243b8332ea7ab10e633a887bf9342a0d18709"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.56.2/pi-linux-x64.tar.gz"
      sha256 "997b121499ab18fd9afc3b34d4fa7fc1ed4fdf52df73840a330ef7bebd7c1eba"
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
