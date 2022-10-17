cask "tidal-zone" do
  version "0.1.1"
  sha256 "d9e39ec3d52350542d27c91d4c18376c6ab41f3f5688d599eceac60b3b112113"

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
    ~/Library/Application Scripts/app.Tidal-Zone,
    ~/Library/Application Support/app.Tidal-Zone,
    ~/Library/Caches/app.Tidal-Zone,
    ~/Library/Containers/app.Tidal-Zone,
    ~/Library/HTTPStorages/app.Tidal-Zone,
    ~/Library/HTTPStorages/app.Tidal-Zone.binarycookies,
    ~/Library/Preferences/app.Tidal-Zone.plist,
    ~/Library/Saved Application State/app.Tidal-Zone.savedState
  ]
end