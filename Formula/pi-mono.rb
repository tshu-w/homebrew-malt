class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.52.12"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.52.12/pi-darwin-arm64.tar.gz"
      sha256 "c7c5d1987e4414cf7982b232ea20ade59905824df0db0bf696efc3aff5000d46"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.52.12/pi-darwin-x64.tar.gz"
      sha256 "8a2127785a2c1b3bee36a79b2539342d48b46c1aa782f6ad66175c5d7af17d68"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.52.12/pi-linux-arm64.tar.gz"
      sha256 "e489e9b08941a488b6ef76cf0b97118a546cbb46ed8347ca990429f8377880b0"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.52.12/pi-linux-x64.tar.gz"
      sha256 "314ffbb4255adc4511a3b2e2d994ffe0aaae92dedd04ff2d80faff034d6cc073"
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
