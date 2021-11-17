cask "tune-out" do
  version "0.8.343"
  sha256 "62b3eb3c5d5f5f62f636bb562df385c07cf67e47d98e9e6e544a58b59b18df95"

  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip",
      verified: "github.com/Tune-Out/"
  name "Tune Out"
  desc "Stream Internet Radio"
  homepage "https://github.com/Tune-Out/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Tune Out.app", target: "App Fair/Tune Out.app"
  binary "#{appdir}/App Fair/Tune Out.app/Contents/MacOS/Tune Out", target: "tune-out"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tune Out.app"
  end

  uninstall quit: "app.Tune-Out"
  zap trash: [
    "~/Library/Caches/app.Tune-Out",
    "~/Library/Containers/app.Tune-Out",
    "~/Library/Preferences/app.Tune-Out.plist",
    "~/Library/Application Scripts/app.Tune-Out",
    "~/Library/Saved Application State/app.Tune-Out.savedState",
  ]
end