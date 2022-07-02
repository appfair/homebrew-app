class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.36", revision: "07b72d0140edd5496a3ec96251ed28fd2e1f8f0d"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.36"

    sha256 cellar: :any, arm64_monterey: "ae466988985ccc4e3dbbbb10f110e116e17c3a52e9b5833b218732f1f5bdd39f"
    sha256 cellar: :any, monterey: "d0f56cb70edc489cf53ce23cd226dceae52ccf2c71b0a5d91c492599328f7da8"
    sha256 cellar: :any, x86_64_linux: "326afabd552842e1608729b7a5c8f1427b8dc1f35b827f9bb26e95de576d7d67"
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
