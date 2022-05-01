cask "tweet-storm-prerelease" do
  version "0.0.11"
  sha256 "83adb7762f1f07d7ff55c943c269ab4a9342f222d1373ba06e8e62d94ba24971"

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
    "~/Library/Caches/app.Tweet-Storm",
    "~/Library/Containers/app.Tweet-Storm",
    "~/Library/Preferences/app.Tweet-Storm.plist",
    "~/Library/Application Scripts/app.Tweet-Storm",
    "~/Library/Saved Application State/app.Tweet-Storm.savedState",
  ]
end