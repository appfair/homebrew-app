cask "tweet-storm-prerelease" do
  version "0.0.12"
  sha256 "98dbae297fcc754e3695a96c65a3e18b91e887353e7348ed2287914740c56564"

  url "https://github.com/Tweet-Storm/App/releases/download/#{version}/Tweet-Storm-macOS.zip",
      verified: "github.com/Tweet-Storm/"
  name "Tweet Storm"
  desc "Unleash your inner dialog"
  homepage "https://github.com/Tweet-Storm/App/"

  depends_on macos: ">= :monterey"
  

  app "Tweet Storm.app", target: "App Fair/Tweet Storm.app"
  binary "#{appdir}/App Fair/Tweet Storm.app/Contents/MacOS/Tweet Storm", target: "tweet-storm-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tweet Storm.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Tweet-Storm,
    ~/Library/Application Support/app.Tweet-Storm,
    ~/Library/Caches/app.Tweet-Storm,
    ~/Library/Containers/app.Tweet-Storm,
    ~/Library/HTTPStorages/app.Tweet-Storm,
    ~/Library/HTTPStorages/app.Tweet-Storm.binarycookies,
    ~/Library/Preferences/app.Tweet-Storm.plist,
    ~/Library/Saved Application State/app.Tweet-Storm.savedState
  ]
end