cask "pan-opticon" do
  version "0.2.8"
  sha256 "a24fb905074b39da0c2c8950d6cc070bb18f1c479f21a6028c705e94057311e1"

  url "https://github.com/Pan-Opticon/App/releases/download/#{version}/Pan-Opticon-macOS.zip",
      verified: "github.com/Pan-Opticon/"
  name "Pan Opticon"
  desc "Watch the Watchers"
  homepage "https://github.com/Pan-Opticon/App/"

  depends_on macos: ">= :monterey"
  

  app "Pan Opticon.app", target: "App Fair/Pan Opticon.app"
  binary "#{appdir}/App Fair/Pan Opticon.app/Contents/MacOS/Pan Opticon", target: "pan-opticon"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Pan Opticon.app"
  end

  zap trash: [
    "~/Library/Caches/app.Pan-Opticon",
    "~/Library/Containers/app.Pan-Opticon",
    "~/Library/Preferences/app.Pan-Opticon.plist",
    "~/Library/Application Scripts/app.Pan-Opticon",
    "~/Library/Saved Application State/app.Pan-Opticon.savedState",
  ]
end