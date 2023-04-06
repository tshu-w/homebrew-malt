class ClashMeta < Formula
  desc "A rule-based tunnel in Go"
  homepage "https://github.com/MetaCubeX/Clash.Meta"
  version "v1.14.3"

  @os = OS.mac? ? "darwin" : "linux"
  @arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/MetaCubeX/Clash.Meta/releases/download/#{version}/clash.meta-#{@os}-#{@arch}-#{version}.gz"

  livecheck do
    url "https://github.com/MetaCubeX/Clash.Meta/releases"
    regex(%r{href=".*?/releases/tag/v?(\d+(?:\.\d+)+)"}i)
    strategy :page_match do |page, regex|
      page.scan(regex).flatten.uniq.sort
    end
  end

  def install
    bin.install Dir.glob("clash*")[0] => "clash-meta"
  end

  service do
    run opt_bin/"clash-meta"
    keep_alive true
    error_log_path var/"log/clash-meta.log"
    log_path var/"log/clash-meta.log"
  end
end
