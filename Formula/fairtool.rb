class Fairtool < Formula
  desc "Manage a fair-ground ecosystem of apps"
  homepage "https://fair-ground.org"
  url "https://github.com/fair-ground/Fair.git", branch: "main"
  version "latest"
  head "https://github.com/fair-ground/Fair.git", branch: "main"
  license "AGPL-3.0-or-later"

  depends_on "swift"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/fairtool"
  end

  test do
    assert_match ".*Welcome.*", shell_output("#{bin}/fairtool welcome")
  end
end
