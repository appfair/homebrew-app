cask "numeral-mxmmxvi" do
  version "0.0.1"
  sha256 "78da3bf0f1cceaf0ef208a49aa20a4675c1a40f26291078534610851bb5fa897"

  url "https://github.com/Numeral-MXMMXVI/App/releases/download/#{version}/Numeral-MXMMXVI-macOS.zip",
      verified: "github.com/Numeral-MXMMXVI/"
  name "Numeral MXMMXVI"
  desc "A business app for business-folk"
  homepage "https://github.com/Numeral-MXMMXVI/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral MXMMXVI.app", target: "App Fair/Numeral MXMMXVI.app"
  binary "#{appdir}/App Fair/Numeral MXMMXVI.app/Contents/MacOS/Numeral MXMMXVI", target: "numeral-mxmmxvi"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral MXMMXVI.app"
  end

  uninstall quit: "app.Numeral-MXMMXVI"
  zap trash: [
    "~/Library/Caches/app.Numeral-MXMMXVI",
    "~/Library/Containers/app.Numeral-MXMMXVI",
    "~/Library/Preferences/app.Numeral-MXMMXVI.plist",
    "~/Library/Application Scripts/app.Numeral-MXMMXVI",
    "~/Library/Saved Application State/app.Numeral-MXMMXVI.savedState",
  ]
end