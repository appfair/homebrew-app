cask "tune-out" do
  version "0.8.446"
  sha256 "027dd57a3e1c83191e52c0ca3ba7f71c76cf68eed87b7d7315c097a181411bae"

  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip",
      verified: "github.com/Tune-Out/"
  name "Tune Out"
  desc "Stream Internet Radio"
  homepage "https://github.com/Tune-Out/App/"

  depends_on macos: ">= :monterey"
  

  app "Tune Out.app", target: "App Fair/Tune Out.app"
  binary "#{appdir}/App Fair/Tune Out.app/Contents/MacOS/Tune Out", target: "tune-out"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tune Out.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Tune-Out,
    ~/Library/Application Support/app.Tune-Out,
    ~/Library/Caches/app.Tune-Out,
    ~/Library/Containers/app.Tune-Out,
    ~/Library/HTTPStorages/app.Tune-Out,
    ~/Library/HTTPStorages/app.Tune-Out.binarycookies,
    ~/Library/Preferences/app.Tune-Out.plist,
    ~/Library/Saved Application State/app.Tune-Out.savedState
  ]
end