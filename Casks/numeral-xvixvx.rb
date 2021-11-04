cask "numeral-xvixvx" do
  version "0.0.1"
  sha256 "fba0e3672900a4b22e56fad98404baabb04001fdb3bc92c024daf3f8343ce6ca"

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