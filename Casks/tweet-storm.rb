cask "tweet-storm" do
  version "0.0.4"
  sha256 "bf51807860cc8f3962b1e8adaa4790d38010b7ac3a05223646affeb411ff688e"

  url "https://github.com/Tweet-Storm/App/releases/download/#{version}/Tweet-Storm-macOS.zip",
      verified: "github.com/Tweet-Storm/"
  name "Tweet Storm"
  desc "Unleash your inner dialog"
  homepage "https://github.com/Tweet-Storm/App/"

  depends_on macos: ">= :monterey"
  

  app "Tweet Storm.app", target: "App Fair/Tweet Storm.app"
  binary "#{appdir}/App Fair/Tweet Storm.app/Contents/MacOS/Tweet Storm", target: "tweet-storm"

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