cask "numeral-xxvvii" do
  version "0.0.1"
  sha256 "f6e2381f6b1f9f2ad104b934bc1e4a0b0de065e883e64046a020c6c6e01d198d"

  url "https://github.com/Numeral-XXVVII/App/releases/download/#{version}/Numeral-XXVVII-macOS.zip",
      verified: "github.com/Numeral-XXVVII/"
  name "Numeral XXVVII"
  desc "A simple but useful app"
  homepage "https://github.com/Numeral-XXVVII/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XXVVII.app", target: "App Fair/Numeral XXVVII.app"
  binary "#{appdir}/App Fair/Numeral XXVVII.app/Contents/MacOS/Numeral XXVVII", target: "numeral-xxvvii"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XXVVII.app"
  end

  uninstall quit: "app.Numeral-XXVVII"
  zap trash: [
    "~/Library/Caches/app.Numeral-XXVVII",
    "~/Library/Containers/app.Numeral-XXVVII",
    "~/Library/Preferences/app.Numeral-XXVVII.plist",
    "~/Library/Application Scripts/app.Numeral-XXVVII",
    "~/Library/Saved Application State/app.Numeral-XXVVII.savedState",
  ]
end