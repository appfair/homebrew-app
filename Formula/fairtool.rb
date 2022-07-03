class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.43", revision: "63f4936a77c8ae36fa9e25591170bed9957d20d7"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.43"

    sha256 cellar: :any, arm64_monterey: "70c42bd389dc2b524810b0c61c9aee1f9b915cbcbb01c5453873c89fa6f2ce43"
    sha256 cellar: :any, monterey: "28e01634c9cc9a3022cc87586a777a40b534e05f95e552c22e34c6d723ec14d8"
    sha256 cellar: :any, x86_64_linux: "b933c0599f1821cbb8a7f0e5b58acb26b8814dc8be123362611195b957697b95"
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
