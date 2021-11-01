cask "numeral-xlivx" do
  version "0.0.3"
  sha256 "c54fb144949a304321baa2d864a8e2b08254c0f4aa9b828008211af3d8b4eea6"

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