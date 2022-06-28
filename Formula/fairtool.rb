class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.6", revision: "fb7b77356467baba78b4ca9cd6ed698c8a6a6b62"
  sha256 "cb02711011e400d9bfb05a1c58b685486a1f1fa926ba27972d8267b7f95c89c5"
  license "AGPL-3.0"
  head "https://github.com/fair-ground/Fair.git", branch: "main"

  depends_on "swift"
  conflicts_with "fairtool-head", because: "either fairtool or fairtool-head can be installed"
  uses_from_macos "swift", since: :big_sur # Swift 5.5.0

  def install
    system "swift", "build", "--product", "fairtool", "-c", "release", \
           "--disable-sandbox", "-Xswiftc", "-cross-module-optimization"
    bin.install ".build/release/fairtool"
  end

  test do
    assert_match /^fairtool [0-9]+\.[0-9]+\.[0-9]+$/, shell_output("#{bin}/fairtool version 2>&1").strip
    if OS.mac?
      shell_output("#{bin}/fairtool app info /System/Applications/Calendar.app | jq -e '.[].entitlements[0][\"com.apple.security.app-sandbox\"]'")
    end
  end
end
