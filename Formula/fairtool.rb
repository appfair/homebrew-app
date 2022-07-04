class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.48", revision: "7903824035f64fc62c5f11b0c07d4ef8854d17d4"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.48"

    sha256 cellar: :any, arm64_monterey: "750abb37b9f9bf4ede927f8c5cd0f3dfa4c4e076a69098c276edc1969aa71ca5"
    sha256 cellar: :any, monterey: "624501301219acb9dea70e0320533710a7edb24bdf08b0035ab3371220d17b84"
    sha256 cellar: :any, x86_64_linux: "c2f5212dd7c9b1935c78f38d1ffc352f57c6b4d51afd2e5d50b5ffb5066d6517"
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
