cask "eternal-september" do
  version "0.0.27"
  sha256 "69537d7cb80309a1fabbc0be199cab3454f31ea86a9953db6b6acf86bc68b6ba"

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
    "~/Library/Caches/app.Eternal-September",
    "~/Library/Containers/app.Eternal-September",
    "~/Library/Preferences/app.Eternal-September.plist",
    "~/Library/Application Scripts/app.Eternal-September",
    "~/Library/Saved Application State/app.Eternal-September.savedState",
  ]
end