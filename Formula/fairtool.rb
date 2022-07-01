class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.33", revision: "dd986c27a7ad8d862b27f862a7652ba16224cd6d"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.33"

    sha256 cellar: :any, arm64_monterey: "46ccd672848594053d1308834e8f92e21fc86b522829460b40b04e78c18999e7"
    sha256 cellar: :any, monterey: "d1f6c2da9881990d2bad9ae581c48fae0b3a54748e2202004eb3967b2039b809"
    sha256 cellar: :any, x86_64_linux: "a3316e6f876d55b8f7d29adaff0b3d5cb07e5a2d4fbc17a2c7a443bfeb34fde5"
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
