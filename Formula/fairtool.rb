class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.26", revision: "7822b7273d1f910c3e8ad35c29001b41ba529efe"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.26"

    sha256 cellar: :any, arm64_monterey: "b4d111b52863e23c72eb21b78921571e83a3c61be6f82cb5faceddb76a8c074a"
    sha256 cellar: :any, monterey: "5634f648f4e528f46d338f9c6e4e4cda3a736617dc7965194e3035f14fec8c11"
    sha256 cellar: :any, x86_64_linux: "91eb1dd1402f83aec1867b7cd3e9146dcb3af2fa39de6bb16f6fc364435a908b"
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
