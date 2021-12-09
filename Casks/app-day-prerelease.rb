cask "app-day-prerelease" do
  version "0.0.1"
  sha256 "29784e20edd6a31c011e301e30c6c08abb442c9a512cbac128d4e56d1cc68e42"

  url "https://github.com/App-Day/App/releases/download/#{version}/App-Day-macOS.zip",
      verified: "github.com/App-Day/"
  name "App Day"
  desc "A simple but useful app"
  homepage "https://github.com/App-Day/App/"

  depends_on macos: ">= :monterey"
  

  app "App Day.app", target: "App Fair/App Day.app"
  binary "#{appdir}/App Fair/App Day.app/Contents/MacOS/App Day", target: "app-day-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/App Day.app"
  end

  zap trash: [
    "~/Library/Caches/app.App-Day",
    "~/Library/Containers/app.App-Day",
    "~/Library/Preferences/app.App-Day.plist",
    "~/Library/Application Scripts/app.App-Day",
    "~/Library/Saved Application State/app.App-Day.savedState",
  ]
end