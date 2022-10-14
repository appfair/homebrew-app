cask "sun-bow-prerelease" do
  version "0.0.28"
  sha256 "217935a3c15b9b1307a0b46c9d17098d610046118773f9a373533a664e204bbb"

  url "https://github.com/Sun-Bow/App/releases/download/#{version}/Sun-Bow-macOS.zip",
      verified: "github.com/Sun-Bow/"
  name "Sun Bow"
  desc "An app for sunnier days"
  homepage "https://github.com/Sun-Bow/App/"

  depends_on macos: ">= :monterey"
  

  app "Sun Bow.app", target: "App Fair/Sun Bow.app"
  binary "#{appdir}/App Fair/Sun Bow.app/Contents/MacOS/Sun Bow", target: "sun-bow-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Sun Bow.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Sun-Bow,
    ~/Library/Application Support/app.Sun-Bow,
    ~/Library/Caches/app.Sun-Bow,
    ~/Library/Containers/app.Sun-Bow,
    ~/Library/HTTPStorages/app.Sun-Bow,
    ~/Library/HTTPStorages/app.Sun-Bow.binarycookies,
    ~/Library/Preferences/app.Sun-Bow.plist,
    ~/Library/Saved Application State/app.Sun-Bow.savedState
  ]
end