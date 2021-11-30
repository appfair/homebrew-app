cask "app-fair-prerelease" do
  version "0.6.248"
  sha256 "c626f1114947bf08742d2733f924b1cfa00fe18fb5e199ec18e6a6889aeea4bb"

  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip",
      verified: "github.com/App-Fair/"
  name "App Fair"
  desc "The App Fair Catalog Browser"
  homepage "https://github.com/App-Fair/App/"

  depends_on macos: ">= :monterey"
  

  app "App Fair.app", target: "App Fair.app"
  binary "#{appdir}/App Fair.app/Contents/MacOS/App Fair", target: "app-fair-prerelease"

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