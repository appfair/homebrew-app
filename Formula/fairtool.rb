class Fairtool < Formula
  desc "Manage a fair-ground ecosystem of apps"
  homepage "https://fair-ground.org"
  url "https://github.com/fair-ground/Fair.git", branch: "main"
  version "latest"
  license "AGPL-3.0-or-later"
  head "https://github.com/fair-ground/Fair.git", branch: "main"

  depends_on "swift"
  uses_from_macos "swift", since: :big_sur # Swift 5.5.0

  def install
    # release build crashes swift 5.6.1 on macOS with the error:
    # "(FragmentOffset >= OffsetInBits && "overlapping or duplicate fragments")"
    # system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "fairtool", "--verbose"
    # bin.install ".build/release/fairtool"
    system "swift", "build", "--disable-sandbox", "-c", "debug", "--product", "fairtool"
    bin.install ".build/debug/fairtool"
  end

  test do
    assert_match ".*Welcome.*", shell_output("#{bin}/fairtool welcome")
  end
end
