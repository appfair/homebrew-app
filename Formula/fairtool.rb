class Fairtool < Formula
  desc "Manage an ecosystem of ipa app sources"
  homepage "https://github.com/fair-ground/Fair"
  url "https://github.com/fair-ground/Fair.git", tag: "0.4.39", revision: "85903eada8f085b872d4671c3872bc6d2eb646f8"
  license "AGPL-3.0"

  bottle do
    root_url "https://github.com/fair-ground/Fair/releases/download/0.4.39"

    sha256 cellar: :any, arm64_monterey: "d8b5852fc2f16e4418954a6695bd8d799f4411d4199e7002e04c6b814540692d"
    sha256 cellar: :any, monterey: "69be32bfedb1974e23602f079c938ab2dbc8424c0b693ede483d9b8a7432eb4f"
    sha256 cellar: :any, x86_64_linux: "b09f58119cd441993ae480632597b12f1846785f91001caaa40a2d634f7d6303"
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
