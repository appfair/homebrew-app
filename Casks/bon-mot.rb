cask "bon-mot" do
  version "0.0.86"
  sha256 "42915d8b2b72c807bc346db878f0e71f6f8a9ec8474dc160625685154a0df09a"

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