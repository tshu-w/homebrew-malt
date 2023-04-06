class ClashPremium < Formula
  desc "Rule-based tunnel in Go (premium version)"
  homepage "https://github.com/Dreamacro/clash/releases/tag/premium"
  version "2023.03.18"

  @os = OS.mac? ? "darwin" : "linux"
  @arch = Hardware::CPU.arm? ? "arm64" : "amd64"

  url "https://github.com/Dreamacro/clash/releases/download/premium/clash-#{@os}-#{@arch}-#{version}.gz"

  livecheck do
    url :homepage
    regex(/(\d{4}[.-]\d{2}[.-]\d{2})/i)
    strategy :page_match do |page, regex|
      page.scan(regex).flatten.uniq.sort
    end
  end

  def install
    bin.install Dir.glob("clash*")[0] => "clash-premium"
  end

  service do
    run opt_bin/"clash-premium"
    keep_alive true
    error_log_path var/"log/clash-premium.log"
    log_path var/"log/clash-premium.log"
  end
end
