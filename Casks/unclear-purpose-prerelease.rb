cask "unclear-purpose-prerelease" do
  version "0.0.1"
  sha256 "8dc122c43e66d68cafc663db06ef2eeb711e3cc4aac11bf0d0643f21d98dc833"

  url "https://github.com/Unclear-Purpose/App/releases/download/#{version}/Unclear-Purpose-macOS.zip",
      verified: "github.com/Unclear-Purpose/"
  name "Unclear Purpose"
  desc "An unclear app"
  homepage "https://github.com/Unclear-Purpose/App/"

  depends_on macos: ">= :monterey"
  

  app "Unclear Purpose.app", target: "App Fair/Unclear Purpose.app"
  binary "#{appdir}/App Fair/Unclear Purpose.app/Contents/MacOS/Unclear Purpose", target: "unclear-purpose-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Unclear Purpose.app"
  end

  zap trash: [
    "~/Library/Caches/app.Unclear-Purpose",
    "~/Library/Containers/app.Unclear-Purpose",
    "~/Library/Preferences/app.Unclear-Purpose.plist",
    "~/Library/Application Scripts/app.Unclear-Purpose",
    "~/Library/Saved Application State/app.Unclear-Purpose.savedState",
  ]
end