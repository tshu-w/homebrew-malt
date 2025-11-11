class Ossutil < Formula
  desc "Command-line utility for Alibaba Cloud OSS"
  homepage "https://github.com/aliyun/ossutil"

  head "https://github.com/aliyun/ossutil.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["GOBIN"] = bin
    system "go", "install", "github.com/aliyun/ossutil@latest"
  end

  test do
    # Expect help text or version output without crashing
    output = shell_output("#{bin}/ossutil --help")
    assert_match "ossutil", output
  end
end
