cask "tidal-zone-prerelease" do
  version "0.0.20"
  sha256 "db951840a4f86b2e0589cb1b41b2c8695570af19f0af03dafb5d79af5fa2734f"

  url "https://github.com/Tidal-Zone/App/releases/download/#{version}/Tidal-Zone-macOS.zip",
      verified: "github.com/Tidal-Zone/"
  name "Tidal Zone"
  desc "What tide is it right now?"
  homepage "https://github.com/Tidal-Zone/App/"

  depends_on macos: ">= :monterey"
  

  app "Tidal Zone.app", target: "App Fair/Tidal Zone.app"
  binary "#{appdir}/App Fair/Tidal Zone.app/Contents/MacOS/Tidal Zone", target: "tidal-zone-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tidal Zone.app"
  end

  zap trash: [
    "~/Library/Caches/app.Tidal-Zone",
    "~/Library/Containers/app.Tidal-Zone",
    "~/Library/Preferences/app.Tidal-Zone.plist",
    "~/Library/Application Scripts/app.Tidal-Zone",
    "~/Library/Saved Application State/app.Tidal-Zone.savedState",
  ]
end