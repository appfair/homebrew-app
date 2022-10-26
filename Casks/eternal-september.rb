cask "eternal-september" do
  version "0.0.45"
  sha256 "0d99cc8205c2901f9e93e49c8dea66e9daa9ecc133eaf5bbf9f66f4f536845a4"

  url "https://github.com/Eternal-September/App/releases/download/#{version}/Eternal-September-macOS.zip",
      verified: "github.com/Eternal-September/"
  name "Eternal September"
  desc "An app for learning Roman Numerals"
  homepage "https://github.com/Eternal-September/App/"

  depends_on macos: ">= :monterey"
  

  app "Eternal September.app", target: "App Fair/Eternal September.app"
  binary "#{appdir}/App Fair/Eternal September.app/Contents/MacOS/Eternal September", target: "eternal-september"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Eternal September.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Eternal-September",
    "~/Library/Application Support/app.Eternal-September",
    "~/Library/Caches/app.Eternal-September",
    "~/Library/Containers/app.Eternal-September",
    "~/Library/HTTPStorages/app.Eternal-September",
    "~/Library/HTTPStorages/app.Eternal-September.binarycookies",
    "~/Library/Preferences/app.Eternal-September.plist",
    "~/Library/Saved Application State/app.Eternal-September.savedState"
  ]
end