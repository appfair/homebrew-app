cask "tune-out" do
  version "0.8.341"
  sha256 "70ffe31e3e27ed71c88a8514fab1bb86be2313ae68de0c1c9e528561cbf98cf4"

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