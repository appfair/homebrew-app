cask "tidal-zone" do
  version "0.0.7"
  sha256 "5eba83bea4ad7ee33fde97eaf493fc7a3f52bc7d271bfceb90ff5d698e8b4f35"

  url "https://github.com/Tidal-Zone/App/releases/download/#{version}/Tidal-Zone-macOS.zip",
      verified: "github.com/Tidal-Zone/"
  name "Tidal Zone"
  desc "What tide is it right now?"
  homepage "https://github.com/Tidal-Zone/App/"

  depends_on macos: ">= :monterey"
  

  app "Tidal Zone.app", target: "App Fair/Tidal Zone.app"
  binary "#{appdir}/App Fair/Tidal Zone.app/Contents/MacOS/Tidal Zone", target: "tidal-zone"

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