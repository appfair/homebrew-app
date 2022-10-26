cask "app-title-prerelease" do
  version "0.0.1"
  sha256 "cdee27f9a4108574041b293ae1483bd748186d61b74cb165f1e60a7b921a6f45"

  url "https://github.com/App-Title/App/releases/download/#{version}/App-Title-macOS.zip",
      verified: "github.com/App-Title/"
  name "App Title"
  desc "A very useful app indeed"
  homepage "https://github.com/App-Title/App/"

  depends_on macos: ">= :monterey"
  

  app "App Title.app", target: "App Fair/App Title.app"
  binary "#{appdir}/App Fair/App Title.app/Contents/MacOS/App Title", target: "app-title-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/App Title.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.App-Title",
    "~/Library/Application Support/app.App-Title",
    "~/Library/Caches/app.App-Title",
    "~/Library/Containers/app.App-Title",
    "~/Library/HTTPStorages/app.App-Title",
    "~/Library/HTTPStorages/app.App-Title.binarycookies",
    "~/Library/Preferences/app.App-Title.plist",
    "~/Library/Saved Application State/app.App-Title.savedState"
  ]
end