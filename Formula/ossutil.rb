class Ossutil < Formula
  desc "Command-line utility for Alibaba Cloud OSS"
  homepage "https://help.aliyun.com/zh/oss/developer-reference/ossutil-overview/"

  version "2.2.0"

  livecheck do
    url :homepage
    regex(%r{ossutil/v2/(\d+(?:\.\d+)+)/ossutil-\1-(?:mac|linux)-(?:amd64|arm64)\.zip}i)
  end

  on_macos do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.0/ossutil-2.2.0-mac-amd64.zip"
      sha256 "6b5fd4902683817e6b419db9ee4b1cb825142e4b95ee603f8aa8e373a69e6bfa"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.0/ossutil-2.2.0-mac-arm64.zip"
      sha256 "dc5b73cde2da84c0e2a13935e63bf419a029fac739cfd6febff9a3ad46af22c3"
    end
  end

  on_linux do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.0/ossutil-2.2.0-linux-amd64.zip"
      sha256 "9e02837d806cfe976ae6c1fc22557d8e0a394ca6d298b45fb9f48a360d3a67f4"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.0/ossutil-2.2.0-linux-arm64.zip"
      sha256 "4f76dfd71d2af8265fcb9309b530f4671242cf5993a8fd0f0e089de7e9665f72"
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
