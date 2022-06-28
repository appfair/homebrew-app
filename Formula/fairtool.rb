class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.17", revision: "8664605f744236b1d0202218f99b45ed382a77b3"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.17"

    sha256 cellar: :any, monterey: "73688981a09f6b069bfb671be625c5da735f36df68cc1b1d50eaaa2ed405e38d"
    sha256 cellar: :any, x86_64_linux: "a005f82b54a74db3f24017d79cc1dd250ff776eb984d7f03bc6e06f18678ccc4"
  end

  head "https://github.com/fair-ground/Fair.git", branch: "main"

  uses_from_macos "swift"

  def install
    if OS.mac?
      # build a univeral binary on macOS
      system "swift", "build", "--product", "fairtool", "-c", "release", "-Xswiftc", "-cross-module-optimization",
             "--disable-sandbox", "--arch", "x86_64", "--arch", "arm64"
      bin.install ".build/apple/Products/Release/fairtool"
    else
      system "swift", "build", "--product", "fairtool", "-c", "release", "-Xswiftc", "-cross-module-optimization",
             "--disable-sandbox"
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
