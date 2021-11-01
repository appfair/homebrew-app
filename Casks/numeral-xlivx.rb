cask "numeral-xlivx" do
  version "0.0.2"
  sha256 "e30c635996a10609c3342e7fcf24c6729fb059351d2bb6081a8d1accfb4272f3"

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