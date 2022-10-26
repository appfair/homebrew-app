cask "tune-out-prerelease" do
  version "0.8.460"
  sha256 "e9baf26401fb6ed272fb649ff9d6b6df32b787c2779eb7024fcbb773b48b2cb2"

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
