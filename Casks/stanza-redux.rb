cask "stanza-redux" do
  version "0.3.24"
  sha256 "f321051e1c8b10732db8a93df1a2b12ae404e473be0d6dbf72406dafab1e634e"

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