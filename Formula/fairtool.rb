class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.47", revision: "491c4ddac27c6e09db2b81b12edd2f2620d39156"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.47"

    sha256 cellar: :any, arm64_monterey: "de461aad8e4c8445a237cf9385ae783fad2b6586a30de3873755b3c01cdbc674"
    sha256 cellar: :any, monterey: "d8246cb90fe98436fe1419a9a379dac1bb6cd16ed420c7fc5305b2470cf46972"
    sha256 cellar: :any, x86_64_linux: "5c4bc487185a6f1c6ea7f9668297bf3cc1a881558475e9d8cdf62c7003006de1"
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
