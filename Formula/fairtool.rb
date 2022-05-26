class Fairtool < Formula
  desc "Tool for managing a fair-ground"
  version "latest"
  homepage "https://fair-ground.org"
  url "https://github.com/fair-ground/Fair.git", branch: "main"
  head "https://github.com/fair-ground/Fair.git", branch: "main"
  license "AGPL-3.0-or-later"

  depends_on "swift"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--configuration", "release"
    bin.install ".build/release/fairtool"
  end
  
  test do
    assert_match ".*Welcome.*", shell_output("#{bin}/fairtool welcome")
  end
end

