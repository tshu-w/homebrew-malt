class Ossutil < Formula
  desc "Command-line utility for Alibaba Cloud OSS"
  homepage "https://help.aliyun.com/zh/oss/developer-reference/ossutil-overview/"

  version "2.2.1"

  livecheck do
    url :homepage
    regex(%r{ossutil/v2/(\d+(?:\.\d+)+)/ossutil-\1-(?:mac|linux)-(?:amd64|arm64)\.zip}i)
  end

  on_macos do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.1/ossutil-2.2.1-mac-amd64.zip"
      sha256 "a1bf1491037e138e52b0b92cdfd620decdc9e22d8dd1d8699226a8f2596b0cc2"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.1/ossutil-2.2.1-mac-arm64.zip"
      sha256 "326bff983e8e02142fc4e68d07f129475f9cbafb9777ed57cd7b6640edd8595c"
    end
  end

  on_linux do
    on_intel do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.1/ossutil-2.2.1-linux-amd64.zip"
      sha256 "fbf1026bd383a5d9bee051cd64a6226c730357ba569491f7c7b91af66560ef1d"
    end
    on_arm do
      url "https://gosspublic.alicdn.com/ossutil/v2/2.2.1/ossutil-2.2.1-linux-arm64.zip"
      sha256 "b7680e79aec0adc9d42a12b795612680a58efec1fad24b0ceb9e13b2390c6652"
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
