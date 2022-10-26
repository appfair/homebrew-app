cask "ultra-light-prerelease" do
  version "0.0.7"
  sha256 "633d678f1dcf6a960ecab0ecff581f2ceb6c1e191e2b7bfea5ba67b4173cdcb1"

  url "https://github.com/Ultra-Light/App/releases/download/#{version}/Ultra-Light-macOS.zip",
      verified: "github.com/Ultra-Light/"
  name "Ultra Light"
  desc "A bit of lite reading"
  homepage "https://github.com/Ultra-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Ultra Light.app", target: "App Fair/Ultra Light.app"
  binary "#{appdir}/App Fair/Ultra Light.app/Contents/MacOS/Ultra Light", target: "ultra-light-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Ultra Light.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Ultra-Light",
    "~/Library/Application Support/app.Ultra-Light",
    "~/Library/Caches/app.Ultra-Light",
    "~/Library/Containers/app.Ultra-Light",
    "~/Library/HTTPStorages/app.Ultra-Light",
    "~/Library/HTTPStorages/app.Ultra-Light.binarycookies",
    "~/Library/Preferences/app.Ultra-Light.plist",
    "~/Library/Saved Application State/app.Ultra-Light.savedState"
  ]
end