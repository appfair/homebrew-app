cask "app-fair-prerelease" do
  version "0.8.107"
  sha256 "09e277f242e4f83b3db4f390baf4d2f4076ff5cf72d71a0bc27b475eb9b31d97"

  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip",
      verified: "github.com/App-Fair/"
  name "App Fair"
  desc "Open-source browser and installer for Homebrew casks and macOS/iOS apps"
  homepage "https://github.com/App-Fair/App/"

  depends_on macos: ">= :monterey"
  

  app "App Fair.app", target: "App Fair.app"
  binary "#{appdir}/App Fair.app/Contents/MacOS/App Fair", target: "app-fair-prerelease"

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