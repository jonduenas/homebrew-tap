class XcbuildParser < Formula
  desc "Parse xcodebuild output and convert to structured JSON"
  homepage "https://github.com/jonduenas/xcbuild-parser"
  url "https://github.com/jonduenas/xcbuild-parser/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "bdf6dadcb599345ef9eb5e5655ef90d5a6ac81a0192722c3874bd5e9db2cad69"
  license "MIT"
  head "https://github.com/jonduenas/xcbuild-parser.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/xcbuild-parser"
  end

  test do
    output = pipe_output("#{bin}/xcbuild-parser", "BUILD SUCCEEDED", 0)
    assert_match '"status"', output
  end
end
