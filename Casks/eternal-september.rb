cask "eternal-september" do
  version "0.0.35"
  sha256 "b7bff211ea457c67d65791a4f90d0c59fbe13bc35f57a22439019dc54ef74902"

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
    ~/Library/Application Scripts/app.Eternal-September,
    ~/Library/Application Support/app.Eternal-September,
    ~/Library/Caches/app.Eternal-September,
    ~/Library/Containers/app.Eternal-September,
    ~/Library/HTTPStorages/app.Eternal-September,
    ~/Library/HTTPStorages/app.Eternal-September.binarycookies,
    ~/Library/Preferences/app.Eternal-September.plist,
    ~/Library/Saved Application State/app.Eternal-September.savedState
  ]
end