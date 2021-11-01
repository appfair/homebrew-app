cask "numeral-xlivx" do
  version "0.0.7"
  sha256 "3a190ee769baf15d095c8f64bdb16e99a41434e4ebbad3b189f28e9bc02e0e0e"

  url "https://github.com/Numeral-XLIVX/App/releases/download/#{version}/Numeral-XLIVX-macOS.zip",
      verified: "github.com/Numeral-XLIVX/"
  name "Numeral XLIVX"
  desc "This is a simple app."
  homepage "https://github.com/Numeral-XLIVX/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XLIVX.app", target: "App Fair/Numeral XLIVX.app"
  binary "#{appdir}/App Fair/Numeral XLIVX.app/Contents/MacOS/Numeral XLIVX", target: "numeral-xlivx"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XLIVX.app"
  end

  uninstall quit: "app.Numeral-XLIVX"
  zap trash: [
    "~/Library/Caches/app.Numeral-XLIVX",
    "~/Library/Containers/app.Numeral-XLIVX",
    "~/Library/Preferences/app.Numeral-XLIVX.plist",
    "~/Library/Application Scripts/app.Numeral-XLIVX",
    "~/Library/Saved Application State/app.Numeral-XLIVX.savedState",
  ]
end