cask "app-fair" do
  version "0.7.279"
  sha256 "61233636c76836e9a53483d67296cbcb3f43c90856811a04c1fde4f748b5d817"

  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip",
      verified: "github.com/App-Fair/"
  name "App Fair"
  desc "The App Fair catalog browser for discovering & installing macOS apps"
  homepage "https://github.com/App-Fair/App/"

  depends_on macos: ">= :monterey"
  

  app "App Fair.app", target: "App Fair.app"
  binary "#{appdir}/App Fair.app/Contents/MacOS/App Fair", target: "app-fair"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair.app"
  end

  zap trash: [
    "~/Library/Caches/app.App-Fair",
    "~/Library/Containers/app.App-Fair",
    "~/Library/Preferences/app.App-Fair.plist",
    "~/Library/Application Scripts/app.App-Fair",
    "~/Library/Saved Application State/app.App-Fair.savedState",
  ]
end