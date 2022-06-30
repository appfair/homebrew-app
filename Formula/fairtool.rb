class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.28", revision: "77028857f2cfc5b26faf83721043cb9b925e9e15"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.28"

    sha256 cellar: :any, arm64_monterey: "c003d61eb2c6cc5c46345a3bb76f714e237efe990380a51631f74aa1644501c1"
    sha256 cellar: :any, monterey: "e4d65473a0c5aaa941c9181f99d1668674cae61d4b3ce85db5840971d95bbca2"
    sha256 cellar: :any, x86_64_linux: "760215df9387f0940a55b7e1053054165860cff0b19955e1021299d2a6f51d11"
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
