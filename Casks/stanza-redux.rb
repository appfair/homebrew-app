cask "stanza-redux" do
  version "0.3.23"
  sha256 "d41e7c5ec8896c62edc1427bfda44573e82885a466e353cddb4ec8745ceb5d01"

  url "https://github.com/Stanza-Redux/App/releases/download/#{version}/Stanza-Redux-macOS.zip",
      verified: "github.com/Stanza-Redux/"
  name "Stanza Redux"
  desc "An electronic book reader"
  homepage "https://github.com/Stanza-Redux/App/"

  depends_on macos: ">= :monterey"
  

  app "Stanza Redux.app", target: "App Fair/Stanza Redux.app"
  binary "#{appdir}/App Fair/Stanza Redux.app/Contents/MacOS/Stanza Redux", target: "stanza-redux"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Stanza Redux.app"
  end

  zap trash: [
    "~/Library/Caches/app.Stanza-Redux",
    "~/Library/Containers/app.Stanza-Redux",
    "~/Library/Preferences/app.Stanza-Redux.plist",
    "~/Library/Application Scripts/app.Stanza-Redux",
    "~/Library/Saved Application State/app.Stanza-Redux.savedState",
  ]
end