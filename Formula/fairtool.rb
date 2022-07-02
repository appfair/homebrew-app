class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.41", revision: "c85b8849130e35ffd07a41843089ee2def1e739e"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.41"

    sha256 cellar: :any, arm64_monterey: "b28d8307d74d77cc92a9b8884d3ffa80c9204de27fd1e00f615970859832f28b"
    sha256 cellar: :any, monterey: "9ba9f2a68ea8026d5bcaccec828026106c199e16b3157d21b9d2861943478d89"
    sha256 cellar: :any, x86_64_linux: "15c58fd08845c02ca9aa7dd71dfeb7bb7c860b8064172b22a2ec668d0f1aaea8"
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
