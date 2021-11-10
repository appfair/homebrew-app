cask "numeral-vixiv" do
  version "0.0.1β"
  sha256 "b97dbc2ee4893d8707ec9b0af71a549105441bfaf24fce6e71177e38829cb98c"

  url "https://github.com/Numeral-VIXIV/App/releases/download/0.0.1/Numeral-VIXIV-macOS.zip",
      verified: "github.com/Numeral-VIXIV/"
  name "Numeral VIXIV"
  desc "An app for learning Roman Numerals"
  homepage "https://github.com/Numeral-VIXIV/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral VIXIV.app", target: "App Fair/Numeral VIXIV.app"
  binary "#{appdir}/App Fair/Numeral VIXIV.app/Contents/MacOS/Numeral VIXIV", target: "numeral-vixiv"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral VIXIV.app"
  end

  uninstall quit: "app.Numeral-VIXIV"
  zap trash: [
    "~/Library/Caches/app.Numeral-VIXIV",
    "~/Library/Containers/app.Numeral-VIXIV",
    "~/Library/Preferences/app.Numeral-VIXIV.plist",
    "~/Library/Application Scripts/app.Numeral-VIXIV",
    "~/Library/Saved Application State/app.Numeral-VIXIV.savedState",
  ]
end