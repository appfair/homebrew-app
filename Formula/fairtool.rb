class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.32", revision: "c17a1ca713bf10c4d510d3d188f6ce4fc06e97d0"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.32"

    sha256 cellar: :any, arm64_monterey: "437f51ebb3be704bcf4edce6a8a1e73d572f294ea88fcf7f41b9256ebdc530fc"
    sha256 cellar: :any, monterey: "221ca4704887cd28a1b6117854a7b39d43fb3c641238bca323a79514f17c543a"
    sha256 cellar: :any, x86_64_linux: "e21ff6dbfd6182d769696f977ce75cbabdecfd0314d3592a04b8db320c070a5b"
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
