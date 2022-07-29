cask "bon-mot" do
  version "0.2.37"
  sha256 "e4872eaccd17c5c06c8f75779befcc7b068673c2d38019e2df893a1f4dc8d004"

  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip",
      verified: "github.com/Bon-Mot/"
  name "Bon Mot"
  desc "Simple dictionary app"
  homepage "https://github.com/Bon-Mot/App/"

  depends_on macos: ">= :monterey"
  

  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  binary "#{appdir}/App Fair/Bon Mot.app/Contents/MacOS/Bon Mot", target: "bon-mot"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Bon Mot.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Bon-Mot,
    ~/Library/Application Support/app.Bon-Mot,
    ~/Library/Caches/app.Bon-Mot,
    ~/Library/Containers/app.Bon-Mot,
    ~/Library/HTTPStorages/app.Bon-Mot,
    ~/Library/HTTPStorages/app.Bon-Mot.binarycookies,
    ~/Library/Preferences/app.Bon-Mot.plist,
    ~/Library/Saved Application State/app.Bon-Mot.savedState
  ]
end