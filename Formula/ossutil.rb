class Ossutil < Formula
  desc "Command-line utility for Alibaba Cloud OSS"
  homepage "https://help.aliyun.com/zh/oss/developer-reference/ossutil-overview/"

  version "2.3.0"

  livecheck do
    url :homepage
    regex(%r{ossutil/v2/(\d+(?:\.\d+)+)/ossutil-\1-(?:mac|linux)-(?:amd64|arm64)\.zip}i)
  end

  on_macos do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.3.0/ossutil-2.3.0-mac-amd64.zip"
      sha256 "8437fdd3ef1a3eb12310f61fcf1c00a5bff5cdab47b4fea815527472e7cf896c"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.3.0/ossutil-2.3.0-mac-arm64.zip"
      sha256 "058fd048f321f8c80def8b748030531646eefe3a82837bf16b581ba7d9c84ac7"
    end
  end

  on_linux do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.3.0/ossutil-2.3.0-linux-amd64.zip"
      sha256 "3ae4d9fc85a7a6e9f5654d1599766f1a3a42a3692870887b5ae9338d582ef65a"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.3.0/ossutil-2.3.0-linux-arm64.zip"
      sha256 "f6c95ba0c2d2ef30290af686ce4d706c701f4734ce8090bee4288a77e3f1d764"
    end
  end

  def install
    # Archive contains a directory named like ossutil-<ver>-mac-<arch>/ossutil
    bin.install Dir["**/ossutil"].first => "ossutil"
  end

  test do
    output = shell_output("#{bin}/ossutil --help")
    assert_match "ossutil", output
  end
end
