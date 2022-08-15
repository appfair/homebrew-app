cask "stanza-redux-prerelease" do
  version "0.3.44"
  sha256 "3028bdfd4eb31d2fca5fdfad71d0daab63f39d167d81510bfa738c28fca86db3"

  url "https://github.com/Stanza-Redux/App/releases/download/#{version}/Stanza-Redux-macOS.zip",
      verified: "github.com/Stanza-Redux/"
  name "Stanza Redux"
  desc "An electronic book reader"
  homepage "https://github.com/Stanza-Redux/App/"

  depends_on macos: ">= :monterey"
  

  app "Stanza Redux.app", target: "App Fair/Stanza Redux.app"
  binary "#{appdir}/App Fair/Stanza Redux.app/Contents/MacOS/Stanza Redux", target: "stanza-redux-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Stanza Redux.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Stanza-Redux,
    ~/Library/Application Support/app.Stanza-Redux,
    ~/Library/Caches/app.Stanza-Redux,
    ~/Library/Containers/app.Stanza-Redux,
    ~/Library/HTTPStorages/app.Stanza-Redux,
    ~/Library/HTTPStorages/app.Stanza-Redux.binarycookies,
    ~/Library/Preferences/app.Stanza-Redux.plist,
    ~/Library/Saved Application State/app.Stanza-Redux.savedState
  ]
end