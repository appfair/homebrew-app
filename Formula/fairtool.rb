class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.40", revision: "8a8e164682a6e5dc85fa8f09dddddb44091cdaff"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.40"

    sha256 cellar: :any, arm64_monterey: "15a0c41b709909185d6899294f9561581e1d3ff278611053d476ffd902af7199"
    sha256 cellar: :any, monterey: "aed082a5587b5d30487c40d7247466a8ccca368c9f1f0c88286a685e2e026e5b"
    sha256 cellar: :any, x86_64_linux: "97e2f235025ff6fe3f7b290082a1dd6011536662f3e436976d17ca47a3e1f62f"
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
