class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.22", revision: "5cda5d98e823bb7034387341dfee91ed6804261b"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.22"

    sha256 cellar: :any, arm64_monterey: "2809436190d230a5c40d9eabab531c1b2853955ed4a33c6937a86ef75bc77fe9"
    sha256 cellar: :any, monterey: "60eecc1ee8b4677f380096ee1d7c5c3e0585b70163f37f134bdaf118faad4884"
    sha256 cellar: :any, x86_64_linux: "c326d23f19c76eb9f09c92f1e1867db7b8e40ddc90322915092498a9f64e286f"
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
