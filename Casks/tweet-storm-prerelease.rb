cask "tweet-storm-prerelease" do
  version "0.0.2"
  sha256 "044faeca6a594df7034db1438d90124f92872f924028025a89cbcc229fd87139"

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