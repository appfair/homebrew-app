cask "ultra-light" do
  version "0.0.5"
  sha256 "9f1bdf5f21403856dc640ecfbc92a6b20fa4a40951ceb99dd1dce1cf6545fc8f"

  url "https://github.com/Ultra-Light/App/releases/download/#{version}/Ultra-Light-macOS.zip",
      verified: "github.com/Ultra-Light/"
  name "Ultra Light"
  desc "A bit of lite reading"
  homepage "https://github.com/Ultra-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Ultra Light.app", target: "App Fair/Ultra Light.app"
  binary "#{appdir}/App Fair/Ultra Light.app/Contents/MacOS/Ultra Light", target: "ultra-light"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Ultra Light.app"
  end

  zap trash: [
    "~/Library/Caches/app.Ultra-Light",
    "~/Library/Containers/app.Ultra-Light",
    "~/Library/Preferences/app.Ultra-Light.plist",
    "~/Library/Application Scripts/app.Ultra-Light",
    "~/Library/Saved Application State/app.Ultra-Light.savedState",
  ]
end