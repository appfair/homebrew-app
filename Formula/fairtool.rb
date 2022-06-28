class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.20", revision: "4417976b5f79c648914ca23aeff2cba2fc1d1372"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.20"

    sha256 cellar: :any, arm64_monterey: "4dc08693cd73364d3b9bbc06b7effbef7ee94a929caf637d43708ac28e6993d0"
    sha256 cellar: :any, monterey: "4fb94f5dd09b4fadfdbd909f7fbd4cfcebc85416d72db1540a9858103e9d239e"
    sha256 cellar: :any, x86_64_linux: "2f5f467b34c313017636f6aad1a7600670c3ebb170a80e4b5b30ef027286723c"
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
