class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.30", revision: "8544da8570d03a15af9812b27e1afbbf0f1477fc"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.30"

    sha256 cellar: :any, arm64_monterey: "7a57ddf076180b632597524be6a30846f0c6eb64b717054dc5eff9faf8e2c827"
    sha256 cellar: :any, monterey: "380c3894a3153a1c1190f28e90f6b7170a687c5eeb015eb3cbc7c40486d0b748"
    sha256 cellar: :any, x86_64_linux: "f1ae1fc7d7da7f536109f5502d49f1165c17e76f9b63ad118730f43385ba596b"
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
