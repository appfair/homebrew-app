class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://fair-ground.org"
  url "https://github.com/fair-ground/Fair.git", branch: "main"
  version "latest"
  license "AGPL-3.0"
  head "https://github.com/fair-ground/Fair.git", branch: "main"

  depends_on "swift"
  uses_from_macos "swift", since: :big_sur # Swift 5.5.0

  def install
    # debug is used rather than release to speed up builds
    system "swift", "build", "--product", "fairtool", "-c", "debug", \
      "--disable-sandbox", "-Xswiftc", "-cross-module-optimization"
    bin.install ".build/debug/fairtool"
  end

  test do
    assert_match "Welcome", shell_output("#{bin}/fairtool welcome")
  end
end
