class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.23", revision: "2c2bc142c48ec0847ddf3609b870082042b8fbb3"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.23"

    sha256 cellar: :any, arm64_monterey: "30676624698fbab41ab9778335882f4352f7ade5fee2501681c1d0f69cc2ff6b"
    sha256 cellar: :any, monterey: "e9a3706627a92908d717b1d515d0f85ac09b978e9c35ef61ffe4719f0d95ca45"
    sha256 cellar: :any, x86_64_linux: "51611c1a185d9798f373f93710090ef6e8db6ec900ffd690d9e6a44f4c267ffb"
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
