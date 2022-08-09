cask "app-fair" do
  version "0.8.96"
  sha256 "8977ba765170c359a37dd2d18492e2f546fb4184fdf6ebe42e3b2e04472b3e74"

  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip",
      verified: "github.com/App-Fair/"
  name "App Fair"
  desc "Open-source browser and installer for Homebrew casks and macOS/iOS apps"
  homepage "https://github.com/App-Fair/App/"

  depends_on macos: ">= :monterey"
  

  app "App Fair.app", target: "App Fair.app"
  binary "#{appdir}/App Fair.app/Contents/MacOS/App Fair", target: "app-fair"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.App-Fair,
    ~/Library/Application Support/app.App-Fair,
    ~/Library/Caches/app.App-Fair,
    ~/Library/Containers/app.App-Fair,
    ~/Library/HTTPStorages/app.App-Fair,
    ~/Library/HTTPStorages/app.App-Fair.binarycookies,
    ~/Library/Preferences/app.App-Fair.plist,
    ~/Library/Saved Application State/app.App-Fair.savedState
  ]
end