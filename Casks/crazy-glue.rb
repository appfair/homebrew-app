cask "crazy-glue" do
  version "0.0.5"
  sha256 "08b510b7dba463f8bb48369a2d326ee72b2fcb39259debf9ae57b696d650ac94"

  url "https://github.com/Crazy-Glue/App/releases/download/#{version}/Crazy-Glue-macOS.zip",
      verified: "github.com/Crazy-Glue/"
  name "Crazy Glue"
  desc "Putting the pieces back together"
  homepage "https://github.com/Crazy-Glue/App/"

  depends_on macos: ">= :monterey"
  

  app "Crazy Glue.app", target: "App Fair/Crazy Glue.app"
  binary "#{appdir}/App Fair/Crazy Glue.app/Contents/MacOS/Crazy Glue", target: "crazy-glue"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Crazy Glue.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Crazy-Glue,
    ~/Library/Application Support/app.Crazy-Glue,
    ~/Library/Caches/app.Crazy-Glue,
    ~/Library/Containers/app.Crazy-Glue,
    ~/Library/HTTPStorages/app.Crazy-Glue,
    ~/Library/HTTPStorages/app.Crazy-Glue.binarycookies,
    ~/Library/Preferences/app.Crazy-Glue.plist,
    ~/Library/Saved Application State/app.Crazy-Glue.savedState
  ]
end