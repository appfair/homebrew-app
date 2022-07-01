class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.34", revision: "001fc6fb6daf87bc012bf2cc23fb350b21226796"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.34"

    sha256 cellar: :any, arm64_monterey: "f0c316ec667a3635864fcffbef148d95ba3ec110c2c144466510bee41d39d92b"
    sha256 cellar: :any, monterey: "abed2034160cf9399fe2483811ddb06140ce65e14bcc6b8222a42532df90facb"
    sha256 cellar: :any, x86_64_linux: "7e3f5629716612063d2bc70a411edeae0ff1008eaba5e688c1f5fb23d27f33ce"
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
