class PiMono < Formula
  desc "Minimal terminal coding harness"
  homepage "https://github.com/badlogic/pi-mono"
  version "0.63.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.2/pi-darwin-arm64.tar.gz"
      sha256 "119beb08439949b32e40ef5c9916cf4fe2882e09b14de51474c2c9de8ffe7380"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.2/pi-darwin-x64.tar.gz"
      sha256 "702d6d685b9f2800146b8299eaac400b79b4e5f8846f27fbf4859840613d76db"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.2/pi-linux-arm64.tar.gz"
      sha256 "ed7a22043474eb15e3e84cca4df7752e78ee16b2617e6a62a2ec8adbd47d80ba"
    else
      url "https://github.com/badlogic/pi-mono/releases/download/v0.63.2/pi-linux-x64.tar.gz"
      sha256 "df00660e91dbebef084e178011480f6eedeec35231f84c44167d413dcc7d5cff"
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
