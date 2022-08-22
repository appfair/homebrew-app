cask "fox-glove" do
  version "0.0.5"
  sha256 "64787301234af0d6b136b516e758ee6c55b189dae5fd345f0e18c2507c5ef900"

  url "https://github.com/Fox-Glove/App/releases/download/#{version}/Fox-Glove-macOS.zip",
      verified: "github.com/Fox-Glove/"
  name "Fox Glove"
  desc "There, I fixed the web for you. You're welcome."
  homepage "https://github.com/Fox-Glove/App/"

  depends_on macos: ">= :monterey"
  

  app "Fox Glove.app", target: "App Fair/Fox Glove.app"
  binary "#{appdir}/App Fair/Fox Glove.app/Contents/MacOS/Fox Glove", target: "fox-glove"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Fox Glove.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Fox-Glove,
    ~/Library/Application Support/app.Fox-Glove,
    ~/Library/Caches/app.Fox-Glove,
    ~/Library/Containers/app.Fox-Glove,
    ~/Library/HTTPStorages/app.Fox-Glove,
    ~/Library/HTTPStorages/app.Fox-Glove.binarycookies,
    ~/Library/Preferences/app.Fox-Glove.plist,
    ~/Library/Saved Application State/app.Fox-Glove.savedState
  ]
end