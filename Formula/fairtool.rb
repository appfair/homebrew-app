class Fairtool < Formula
  desc "Manage a fair-ground ecosystem of apps"
  homepage "https://fair-ground.org"
  url "https://github.com/fair-ground/Fair.git", branch: "main"
  # TODO: url "https://github.com/fair-ground/Fair/archive/0.9.0.tar.gz"
  # TODO: sha256 "a098a48e8761d3aef9abd1a673b8b28b4b35f8dbad15218125e18461104874ca"
  version "latest"
  license "AGPL-3.0-or-later"
  head "https://github.com/fair-ground/Fair.git", branch: "main"

  depends_on xcode: ["13.1", :build]
  depends_on "swift"
  uses_from_macos "swift"

  def install
    # system "swift", "build", "--disable-sandbox", "-c", "debug", "--product", "fairtool"
    # bin.install ".build/debug/fairtool"
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "fairtool", "--verbose"
    bin.install ".build/release/fairtool"
  end

  test do
    assert_match ".*Welcome.*", shell_output("#{bin}/fairtool welcome")
  end
end
