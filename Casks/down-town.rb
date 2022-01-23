cask "down-town" do
  version "0.0.1"
  sha256 "72c9f82a0270a49ae0154fd117b2dbcfcca3ec5516fc365711c80c12370ee277"

  url "https://github.com/Down-Town/App/releases/download/#{version}/Down-Town-macOS.zip",
      verified: "github.com/Down-Town/"
  name "Down Town"
  desc "An urban street guide"
  homepage "https://github.com/Down-Town/App/"

  depends_on macos: ">= :monterey"
  

  app "Down Town.app", target: "App Fair/Down Town.app"
  binary "#{appdir}/App Fair/Down Town.app/Contents/MacOS/Down Town", target: "down-town"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Down Town.app"
  end

  zap trash: [
    "~/Library/Caches/app.Down-Town",
    "~/Library/Containers/app.Down-Town",
    "~/Library/Preferences/app.Down-Town.plist",
    "~/Library/Application Scripts/app.Down-Town",
    "~/Library/Saved Application State/app.Down-Town.savedState",
  ]
end