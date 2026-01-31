class XcbuildParser < Formula
  desc "Parse xcodebuild output and convert to structured JSON"
  homepage "https://github.com/jonduenas/xcbuild-parser"
  url "https://github.com/jonduenas/xcbuild-parser/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1ee5d51ba67e7056ad5942da76a2397f2d002e854b1b7b28ac870bb4ff209c7c"
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
