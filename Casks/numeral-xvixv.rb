cask "numeral-xvixv" do
  version "0.0.1"
  sha256 "dbb58191474d6522e3156343fb21cb37ee0accedfcd376ff56273f8ffcb4f1bd"

  url "https://github.com/Numeral-XVIXV/App/releases/download/#{version}/Numeral-XVIXV-macOS.zip",
      verified: "github.com/Numeral-XVIXV/"
  name "Numeral XVIXV"
  desc "A simple but useful app"
  homepage "https://github.com/Numeral-XVIXV/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XVIXV.app", target: "App Fair/Numeral XVIXV.app"
  binary "#{appdir}/App Fair/Numeral XVIXV.app/Contents/MacOS/Numeral XVIXV", target: "numeral-xvixv"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XVIXV.app"
  end

  uninstall quit: "app.Numeral-XVIXV"
  zap trash: [
    "~/Library/Caches/app.Numeral-XVIXV",
    "~/Library/Containers/app.Numeral-XVIXV",
    "~/Library/Preferences/app.Numeral-XVIXV.plist",
    "~/Library/Application Scripts/app.Numeral-XVIXV",
    "~/Library/Saved Application State/app.Numeral-XVIXV.savedState",
  ]
end