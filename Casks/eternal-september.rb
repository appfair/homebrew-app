cask "eternal-september" do
  version "0.0.32"
  sha256 "4251fc77459c4621f0b52014fa2f76b8e73996bd07e5da04df4550649f586bb1"

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