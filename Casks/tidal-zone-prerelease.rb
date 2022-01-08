cask "tidal-zone-prerelease" do
  version "0.0.1"
  sha256 "dbe6b1b037604023555ae6124503e73439c93239f7fb2b90e32858932c6e4a82"

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