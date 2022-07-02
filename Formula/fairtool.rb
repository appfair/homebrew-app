class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.38", revision: "39266b0420231bd03a492006f184e921657e0abe"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.38"

    sha256 cellar: :any, arm64_monterey: "3de538c52e49fce8993ea65f55adf29ff314f3b4cbb2bd3d8279f56c75921f30"
    sha256 cellar: :any, monterey: "2657f67a40b3722495c9b2ecc90eaddc242cbe13142227311dc9496d1697f474"
    sha256 cellar: :any, x86_64_linux: "b46bd228a662678b75645e89c98b2016cd793f21a33f31e6bc854802de33978d"
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
