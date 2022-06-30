class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.25", revision: "0bea36065c407280ab4b66af30fdb8a7eff778ae"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.25"

    sha256 cellar: :any, arm64_monterey: "e23512bcc2f86d42903d3570956218364ca4fee159cb7bdd688e89d4bbe45794"
    sha256 cellar: :any, monterey: "48d61b718f02f1b4db61dbec63e844c70ec806d00a1560285175b29787bdb361"
    sha256 cellar: :any, x86_64_linux: "85e8d26eb22eef2dbcec95042e80e11eb94bd7c716744a0ce115a23447334d9d"
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
