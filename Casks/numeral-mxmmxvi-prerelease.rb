cask "numeral-mxmmxvi-prerelease" do
  version "0.0.9"
  sha256 "51b1ffd3fd14820e0facc325c40ca5d1954a8705d51ec4408e07018b52255b9b"

  url "https://github.com/Numeral-MXMMXVI/App/releases/download/#{version}/Numeral-MXMMXVI-macOS.zip",
      verified: "github.com/Numeral-MXMMXVI/"
  name "Numeral MXMMXVI"
  desc "A business app for business-folk"
  homepage "https://github.com/Numeral-MXMMXVI/App/"

  depends_on macos: ">= :monterey"
  

  app "Numeral MXMMXVI.app", target: "App Fair/Numeral MXMMXVI.app"
  binary "#{appdir}/App Fair/Numeral MXMMXVI.app/Contents/MacOS/Numeral MXMMXVI", target: "numeral-mxmmxvi-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral MXMMXVI.app"
  end

  zap trash: [
    "~/Library/Caches/app.Numeral-MXMMXVI",
    "~/Library/Containers/app.Numeral-MXMMXVI",
    "~/Library/Preferences/app.Numeral-MXMMXVI.plist",
    "~/Library/Application Scripts/app.Numeral-MXMMXVI",
    "~/Library/Saved Application State/app.Numeral-MXMMXVI.savedState",
  ]
end