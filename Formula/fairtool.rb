class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.21", revision: "aaf5222649c8bd1ad723e5d831e7a601da5cef14"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.21"

    sha256 cellar: :any, arm64_monterey: "b7e99499c1c016540dd9a4c1d58e058ee316c2e3f23ec835030ef9c5f2560936"
    sha256 cellar: :any, monterey: "4fef3bc3f911c9635ecbf0a531de62ff15ef78becd12297cb045a17f9a868890"
    sha256 cellar: :any, x86_64_linux: "4db737ea671936fb9ddbddd2c17fddb6dc8d74e882270786d1562256bb30fbed"
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
