cask "tidal-zone-prerelease" do
  version "0.0.14"
  sha256 "da36bf842dcf33e25778ba7671494043ee09375912a0d5a15d877b8a3a576ae6"

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