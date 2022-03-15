cask "tune-out" do
  version "0.8.419"
  sha256 "a7e7702a3f9c0a64d6daced827e56abb91d8d48f03af2c8701164b0120016940"

  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip",
      verified: "github.com/Tune-Out/"
  name "Tune Out"
  desc "Stream Internet Radio"
  homepage "https://github.com/Tune-Out/App/"

  depends_on macos: ">= :monterey"
  

  app "Tune Out.app", target: "App Fair/Tune Out.app"
  binary "#{appdir}/App Fair/Tune Out.app/Contents/MacOS/Tune Out", target: "tune-out"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tune Out.app"
  end

  zap trash: [
    "~/Library/Caches/app.Tune-Out",
    "~/Library/Containers/app.Tune-Out",
    "~/Library/Preferences/app.Tune-Out.plist",
    "~/Library/Application Scripts/app.Tune-Out",
    "~/Library/Saved Application State/app.Tune-Out.savedState",
  ]
end