cask "bon-mot-prerelease" do
  version "0.2.33"
  sha256 "188906482b46893630a541618e20f82abff3d2c501df9225392136692f794b36"

  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip",
      verified: "github.com/Bon-Mot/"
  name "Bon Mot"
  desc "Simple dictionary app"
  homepage "https://github.com/Bon-Mot/App/"

  depends_on macos: ">= :monterey"
  

  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  binary "#{appdir}/App Fair/Bon Mot.app/Contents/MacOS/Bon Mot", target: "bon-mot-prerelease"

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