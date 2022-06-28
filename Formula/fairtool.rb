class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.16", revision: "017cb7f97a6eef0a4083c01ccb7dd4f0a7cf74a1"
  license "AGPL-3.0"

  head "https://github.com/fair-ground/Fair.git", branch: "main"

  uses_from_macos "swift"

  def install
    if OS.mac?
      # build a univeral binary on macOS
      system "swift", "build", "--product", "fairtool", "-c", "release", "-Xswiftc", "-cross-module-optimization", "--disable-sandbox", "--arch", "x86_64", "--arch", "arm64"
      bin.install ".build/apple/Products/Release/fairtool"
    else
      system "swift", "build", "--product", "fairtool", "-c", "release", "-Xswiftc", "-cross-module-optimization", "--disable-sandbox"
      bin.install ".build/release/fairtool"
    end
  end

  test do
    assert_match (/^fairtool [0-9]+\.[0-9]+\.[0-9]+$/), shell_output("#{bin}/fairtool version 2>&1").strip
    if OS.mac?
      shell_output("#{bin}/fairtool app info /System/Applications/Calendar.app \
        | jq -e '.[].entitlements[0][\"com.apple.security.app-sandbox\"]'")
    end
  end
end
