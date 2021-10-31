cask "bon-mot" do
  version "0.0.47"
  sha256 "fbab218fd56f7ed1f79b3ba016a40056ddd4652c4e5527e951403443b2fd3901"

  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip",
      verified: "github.com/Bon-Mot/"
  name "Bon Mot"
  desc "Book reader"
  homepage "https://github.com/Bon-Mot/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  binary "#{appdir}/App Fair/Bon Mot.app/Contents/MacOS/Bon Mot", target: "bon-mot"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Bon Mot.app"
  end

  uninstall quit: "app.Bon-Mot"
  zap trash: [
    "~/Library/Caches/app.Bon-Mot",
    "~/Library/Containers/app.Bon-Mot",
    "~/Library/Preferences/app.Bon-Mot.plist",
    "~/Library/Application Scripts/app.Bon-Mot",
    "~/Library/Saved Application State/app.Bon-Mot.savedState",
  ]
end