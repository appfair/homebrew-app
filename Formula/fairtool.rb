class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.29", revision: "91221f3af19ca75084e72b19e643617610d9bc33"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.29"

    sha256 cellar: :any, arm64_monterey: "ed46b274c68a426ea482afd7bfeaff738395d4223485a986df3cbd79ae951f2b"
    sha256 cellar: :any, monterey: "1e58abaf1376d15ce27bb16b200f95883be776b383651701c1b5b185a7b4b547"
    sha256 cellar: :any, x86_64_linux: "c920e0c05815ee46d61d7988efed536e85388c874067ccdd5745b9d8116faf6d"
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
