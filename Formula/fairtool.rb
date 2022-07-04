class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.49", revision: "3c1fa8ef10168d4de50317d7b591cf482bf043ee"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.49"

    sha256 cellar: :any, arm64_monterey: "43d40799b26bfd2c7d627ae245159f4cc63b8d0111f682c946fc2268689c3493"
    sha256 cellar: :any, monterey: "80c391002c2486ea7a392f780d27d532682cf6680e01d2c35fb124d47fd6b8b3"
    sha256 cellar: :any, x86_64_linux: "012208d94df4287e55ddaccfcc11d37a808446ef28c1d87b2736b66038e1b4dd"
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
