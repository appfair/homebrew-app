cask "tune-out-prerelease" do
  version "0.8.460"
  sha256 "80fe509d25702bd6999a04389b3eb058e3724767f5276050e48ba047e3a35b76"

  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip",
      verified: "github.com/Tune-Out/"
  name "Tune Out"
  desc "Stream Internet Radio"
  homepage "https://github.com/Tune-Out/App/"

  depends_on macos: ">= :monterey"
  

  app "Tune Out.app", target: "App Fair/Tune Out.app"
  binary "#{appdir}/App Fair/Tune Out.app/Contents/MacOS/Tune Out", target: "tune-out-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tune Out.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Tune-Out",
    "~/Library/Application Support/app.Tune-Out",
    "~/Library/Caches/app.Tune-Out",
    "~/Library/Containers/app.Tune-Out",
    "~/Library/HTTPStorages/app.Tune-Out",
    "~/Library/HTTPStorages/app.Tune-Out.binarycookies",
    "~/Library/Preferences/app.Tune-Out.plist",
    "~/Library/Saved Application State/app.Tune-Out.savedState"
  ]
end