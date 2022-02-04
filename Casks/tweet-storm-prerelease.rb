cask "tweet-storm-prerelease" do
  version "0.0.7"
  sha256 "3ab711fbb0febe18ac5b91cf86bc72bff950ed3d537405c0a234ab9931e1b57a"

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