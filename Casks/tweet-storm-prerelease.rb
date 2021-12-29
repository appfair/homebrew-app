cask "tweet-storm-prerelease" do
  version "0.0.1"
  sha256 "b08ea3bdd8a9a5773fb7373b86fea70432cf880bd63d09a0a473bba7d6fa34cf"

  url "https://github.com/Tweet-Storm/App/releases/download/#{version}/Tweet-Storm-macOS.zip",
      verified: "github.com/Tweet-Storm/"
  name "Tweet Storm"
  desc "Fork to make an App Fair App"
  homepage "https://github.com/Tweet-Storm/App/"

  depends_on macos: ">= :monterey"
  

  app "Tweet Storm.app", target: "App Fair/Tweet Storm.app"
  binary "#{appdir}/App Fair/Tweet Storm.app/Contents/MacOS/Tweet Storm", target: "tweet-storm-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tweet Storm.app"
  end

  zap trash: [
    "~/Library/Caches/app.Tweet-Storm",
    "~/Library/Containers/app.Tweet-Storm",
    "~/Library/Preferences/app.Tweet-Storm.plist",
    "~/Library/Application Scripts/app.Tweet-Storm",
    "~/Library/Saved Application State/app.Tweet-Storm.savedState",
  ]
end