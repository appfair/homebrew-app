cask "numeral-xliv" do
  version "0.0.1"
  sha256 "116cd792d8954a5ccf51a120edadaeb1d0e5a41c07a18d171801597ebd1cb12c"

  url "https://github.com/Numeral-XLIV/App/releases/download/#{version}/Numeral-XLIV-macOS.zip",
      verified: "github.com/Numeral-XLIV/"
  name "Numeral XLIV"
  desc "This is a simple app."
  homepage "https://github.com/Numeral-XLIV/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XLIV.app", target: "App Fair/Numeral XLIV.app"
  binary "#{appdir}/App Fair/Numeral XLIV.app/Contents/MacOS/Numeral XLIV", target: "numeral-xliv"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XLIV.app"
  end

  uninstall quit: "app.Numeral-XLIV"
  zap trash: [
    "~/Library/Caches/app.Numeral-XLIV",
    "~/Library/Containers/app.Numeral-XLIV",
    "~/Library/Preferences/app.Numeral-XLIV.plist",
    "~/Library/Application Scripts/app.Numeral-XLIV",
    "~/Library/Saved Application State/app.Numeral-XLIV.savedState",
  ]
end