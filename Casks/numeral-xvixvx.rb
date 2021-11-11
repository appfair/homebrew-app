cask "numeral-xvixvx" do
  version "0.0.3"
  sha256 "583914f0e5f3d1fa1a7eb881922beaf12c25014f05590647dcb1fbc8c1152796"

  url "https://github.com/Numeral-XVIXVX/App/releases/download/#{version}/Numeral-XVIXVX-macOS.zip",
      verified: "github.com/Numeral-XVIXVX/"
  name "Numeral XVIXVX"
  desc "A simple yet useful app"
  homepage "https://github.com/Numeral-XVIXVX/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XVIXVX.app", target: "App Fair/Numeral XVIXVX.app"
  binary "#{appdir}/App Fair/Numeral XVIXVX.app/Contents/MacOS/Numeral XVIXVX", target: "numeral-xvixvx"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XVIXVX.app"
  end

  uninstall quit: "app.Numeral-XVIXVX"
  zap trash: [
    "~/Library/Caches/app.Numeral-XVIXVX",
    "~/Library/Containers/app.Numeral-XVIXVX",
    "~/Library/Preferences/app.Numeral-XVIXVX.plist",
    "~/Library/Application Scripts/app.Numeral-XVIXVX",
    "~/Library/Saved Application State/app.Numeral-XVIXVX.savedState",
  ]
end