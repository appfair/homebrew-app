class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair/archive/0.3.18.tar.gz"
  sha256 "497c615daf0534c2be53a4149b251dcea16796ebab5fc40cc7491a65b7ac2e53"
  license "AGPL-3.0"
  head "https://github.com/fair-ground/Fair.git", branch: "main"

  depends_on "swift"
  conflicts_with "fairtool", because: "either fairtool or fairtool-head can be installed"
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
