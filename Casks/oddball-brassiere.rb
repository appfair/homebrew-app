cask "oddball-brassiere" do
  version "0.0.3"
  sha256 "22f4a2b325477eb33088018136cd035a8ab991fd43333efc5993862dd36bdc33"

  url "https://github.com/Oddball-Brassiere/App/releases/download/#{version}/Oddball-Brassiere-macOS.zip",
      verified: "github.com/Oddball-Brassiere/"
  name "Oddball Brassiere"
  desc "A simple demo app"
  homepage "https://github.com/Oddball-Brassiere/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Oddball Brassiere.app", target: "App Fair/Oddball Brassiere.app"
  binary "#{appdir}/App Fair/Oddball Brassiere.app/Contents/MacOS/Oddball Brassiere", target: "oddball-brassiere"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Oddball Brassiere.app"
  end

  uninstall quit: "app.Oddball-Brassiere"
  zap trash: [
    "~/Library/Caches/app.Oddball-Brassiere",
    "~/Library/Containers/app.Oddball-Brassiere",
    "~/Library/Preferences/app.Oddball-Brassiere.plist",
    "~/Library/Application Scripts/app.Oddball-Brassiere",
    "~/Library/Saved Application State/app.Oddball-Brassiere.savedState",
  ]
end