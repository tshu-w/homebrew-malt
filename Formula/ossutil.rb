class Ossutil < Formula
  desc "Command-line utility for Alibaba Cloud OSS"
  homepage "https://help.aliyun.com/zh/oss/developer-reference/ossutil-overview/"

  version "2.2.2"

  livecheck do
    url :homepage
    regex(%r{ossutil/v2/(\d+(?:\.\d+)+)/ossutil-\1-(?:mac|linux)-(?:amd64|arm64)\.zip}i)
  end

  on_macos do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.2/ossutil-2.2.2-mac-amd64.zip"
      sha256 "5a0e34e6c439eb0b0ba7b9a67958d5d3b031389437a952a0704520b5acb433d0"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.2/ossutil-2.2.2-mac-arm64.zip"
      sha256 "d3fafc4c961f7c58083f6b65a698a169992ba87177001f066ec8c2837a30e23e"
    end
  end

  on_linux do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.2/ossutil-2.2.2-linux-amd64.zip"
      sha256 "d4308515689144c6b213d4998787abbd232dd6714fc43dedbe87064c2c34dee1"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.2/ossutil-2.2.2-linux-arm64.zip"
      sha256 "dcadb6aa97ddbae523e427e9397a529a04c2f21b4204065ce30e21d44908faa0"
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
