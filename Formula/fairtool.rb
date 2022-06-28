class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.19", revision: "14619e37628b6e0ded53ad48155a873e82ab7f9a"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.19"

    sha256 cellar: :any, arm64_monterey: "72d05e5184fff80c10c60dd801c72f2bb3b2c0e34c050803bb6e6b51edcd8e67"
    sha256 cellar: :any, monterey: "72d05e5184fff80c10c60dd801c72f2bb3b2c0e34c050803bb6e6b51edcd8e67"
    sha256 cellar: :any, x86_64_linux: "b3b9a8acf7445781119efe6e81df731748192631863be88ad41a41332ac852d8"
  end

  head "https://github.com/fair-ground/Fair.git", branch: "main"

  uses_from_macos "swift"

  def install
    if OS.mac?
      # build a univeral binary on macOS
      system "swift", "build", "--product", "fairtool", "-c", "release", "-Xswiftc", "-cross-module-optimization",
             "--disable-sandbox", "--arch", "x86_64", "--arch", "arm64"
      bin.install ".build/apple/Products/Release/fairtool"
    else
      system "swift", "build", "--product", "fairtool", "-c", "release", "-Xswiftc", "-cross-module-optimization",
             "--disable-sandbox"
      bin.install ".build/release/fairtool"
    end
  end

  test do
    assert_match (/^fairtool [0-9]+\.[0-9]+\.[0-9]+$/), shell_output("#{bin}/fairtool version 2>&1").strip
    if OS.mac?
      shell_output("#{bin}/fairtool app info /System/Applications/Calendar.app \
        | jq -e '.[].entitlements[0][\"com.apple.security.app-sandbox\"]'")
    end
  end
end
