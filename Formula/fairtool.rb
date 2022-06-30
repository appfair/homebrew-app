class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.27", revision: "047c0742e661d735891f81b35afc0bf401e220b2"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.27"

    sha256 cellar: :any, arm64_monterey: "50f9389a3f78a6a79f63ad40a2e15206e8459e63361bfe100e169b81d92f87bc"
    sha256 cellar: :any, monterey: "e4bcb593c8061cd0f4572e4b1d3d7040332f2b24a428a4e8d8e1a9496062dcb4"
    sha256 cellar: :any, x86_64_linux: "b0bad1e9a27495e709cc2005bbeed29f5cbc0a09348bb1e7a90e0395a77dea13"
  end

  head "https://github.com/fair-ground/Fair.git", branch: "main"

  uses_from_macos "swift"

  def install
    system "swift", "build", "--product", "fairtool", "-c", "release",
           "-Xswiftc", "-cross-module-optimization", "--disable-sandbox",
           *(ENV["HOMEBREW_FAIRTOOL_ARCH"] ? ["--arch", ENV["HOMEBREW_FAIRTOOL_ARCH"]] : [])
    bin.install ".build/release/fairtool"
  end

  test do
    assert_match (/^fairtool [0-9]+\.[0-9]+\.[0-9]+$/), shell_output("#{bin}/fairtool version 2>&1").strip
    if OS.mac?
      shell_output("#{bin}/fairtool app info /System/Applications/Calendar.app \
        | jq -e '.[].entitlements[0][\"com.apple.security.app-sandbox\"]'")
    end
  end
end
