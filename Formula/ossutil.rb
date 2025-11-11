class Ossutil < Formula
  desc "Command-line utility for Alibaba Cloud OSS"
  homepage "https://github.com/aliyun/ossutil"

  url "https://github.com/aliyun/ossutil/archive/refs/tags/v1.7.19.tar.gz"
  sha256 "25fb364cb1d1eb254a2629359c5e0c94a68e352846caeed0b45c971ac9a17dd5"
  version "1.7.19"

  head "https://github.com/aliyun/ossutil.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    # Expect help text or version output without crashing
    output = shell_output("#{bin}/ossutil --help")
    assert_match "ossutil", output
  end
end
