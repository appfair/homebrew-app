class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.31", revision: "95d95014922d598de0fc9e322ad3afa10786bbce"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.31"

    sha256 cellar: :any, arm64_monterey: "2ca73a28ee253a28f5c3d5c672569323279de97b612ef2f131dab3134d179104"
    sha256 cellar: :any, monterey: "5d96f8858a9dc2cf62abe3ba59b20e1d058391245170d5e26d50345faef80048"
    sha256 cellar: :any, x86_64_linux: "683a3b7a4b61862ef222b41263c4ae6b7652d6a66816a87c7cb2ed2869a63fe0"
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
