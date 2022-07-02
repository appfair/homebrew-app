class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.37", revision: "e47b3d455f84e99617300cfd4355fa5c783e5afb"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.37"

    sha256 cellar: :any, arm64_monterey: "85a113bbb295ff85af87fc440207214692508f1fca5246011aebef47c3c78d7b"
    sha256 cellar: :any, monterey: "6dc6d52a6933a36674fb61f8ccf7e131cb3ab3dd6ad45f88c3d2b2159421d3ea"
    sha256 cellar: :any, x86_64_linux: "0e370fbf41e0ad8eae43085743f654be3fe8b2263a2c04354997d9fc86720acf"
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
