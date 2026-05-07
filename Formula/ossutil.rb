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
      sha256 "03a38665ce93730b8b2452432a3e1f91c5c27fc10c95d28cf1cef4554c161534"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.3.0/ossutil-2.3.0-mac-arm64.zip"
      sha256 "bdc9b482a0c3bb0aeb807140ce6a2f83e04b04fb9812ef162d7f3c3610f94952"
    end
  end

  on_linux do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.3.0/ossutil-2.3.0-linux-amd64.zip"
      sha256 "6fed4399266c4e48590feb513b5c98b12eef47ffdbf24574620d4da06560bf6c"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.3.0/ossutil-2.3.0-linux-arm64.zip"
      sha256 "ad9beb9fba6f44a1750ac2898c07a73e150d87b4ce7e09bc968ab2926a29ac44"
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
