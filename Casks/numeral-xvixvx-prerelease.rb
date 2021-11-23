cask "numeral-xvixvx-prerelease" do
  version "0.2.6"
  sha256 "a0565e11daaa77c4d0647869bc5247955c0b67c334158a189ec7f01ec716160f"

  url "https://github.com/Numeral-XVIXVX/App/releases/download/#{version}/Numeral-XVIXVX-macOS.zip",
      verified: "github.com/Numeral-XVIXVX/"
  name "Numeral XVIXVX"
  desc "A simple yet useful app"
  homepage "https://github.com/Numeral-XVIXVX/App/"

  depends_on macos: ">= :monterey"
  

  app "Numeral XVIXVX.app", target: "App Fair/Numeral XVIXVX.app"
  binary "#{appdir}/App Fair/Numeral XVIXVX.app/Contents/MacOS/Numeral XVIXVX", target: "numeral-xvixvx-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XVIXVX.app"
  end

  zap trash: [
    "~/Library/Caches/app.Numeral-XVIXVX",
    "~/Library/Containers/app.Numeral-XVIXVX",
    "~/Library/Preferences/app.Numeral-XVIXVX.plist",
    "~/Library/Application Scripts/app.Numeral-XVIXVX",
    "~/Library/Saved Application State/app.Numeral-XVIXVX.savedState",
  ]
end