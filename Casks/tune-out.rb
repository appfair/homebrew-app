cask "tune-out" do
  version "0.8.396"
  sha256 "7456ddcd6d023bb70e08b95d3f048e2fd4f848b6c23faef2e6cb55ee5ffc5d00"

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