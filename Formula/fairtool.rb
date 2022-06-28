class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.15", revision: "943ef3ddb3e4d4de4be6543a94047ea2c050698d"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.15"

    sha256 cellar: :any, monterey: "c644d967aab428ccdcce284efa1d7df1224139b0387dfa865fdce773af455c1f"
    sha256 cellar: :any, x86_64_linux: "29f8d6089944e46af547784965507423ef4cdc5814f4f9dfd8cdf43c81e4052a"
  end

  head "https://github.com/fair-ground/Fair.git", branch: "main"

  uses_from_macos "swift"

  def install
    args = [
      "-c",
      "release",
      "-Xswiftc",
      "-cross-module-optimization",
      "--disable-sandbox",
    ]

    if OS.mac?
      args << "--arch"
      args << "x86_64"
      args << "--arch"
      args << "arm64"
    end

    system "swift", "build", "--product", "fairtool", *args
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
