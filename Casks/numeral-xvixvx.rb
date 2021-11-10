cask "numeral-xvixvx" do
  version "0.0.2β"
  sha256 "a024e2d075941619f2e790045692c8af8ac223affd861ce7e5cea2707dbf0e8e"

  url "https://github.com/Numeral-XVIXVX/App/releases/download/0.0.2/Numeral-XVIXVX-macOS.zip",
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