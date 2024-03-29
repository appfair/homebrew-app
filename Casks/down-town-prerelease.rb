cask "down-town-prerelease" do
  version "0.0.3"
  sha256 "100691a398de53e5ca21540f1dd272158c3c0307362bb61722aa536f24a4410d"

  url "https://github.com/Down-Town/App/releases/download/#{version}/Down-Town-macOS.zip",
      verified: "github.com/Down-Town/"
  name "Down Town"
  desc "An urban street guide"
  homepage "https://github.com/Down-Town/App/"

  depends_on macos: ">= :monterey"
  

  app "Down Town.app", target: "App Fair/Down Town.app"
  binary "#{appdir}/App Fair/Down Town.app/Contents/MacOS/Down Town", target: "down-town-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Down Town.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Down-Town",
    "~/Library/Application Support/app.Down-Town",
    "~/Library/Caches/app.Down-Town",
    "~/Library/Containers/app.Down-Town",
    "~/Library/HTTPStorages/app.Down-Town",
    "~/Library/HTTPStorages/app.Down-Town.binarycookies",
    "~/Library/Preferences/app.Down-Town.plist",
    "~/Library/Saved Application State/app.Down-Town.savedState"
  ]
end