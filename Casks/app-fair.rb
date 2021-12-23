cask "app-fair" do
  version "0.7.59"
  sha256 "c3d27845c484cb7b08e1a321aebc1cd02d2089a7c691f88ebe3ce659ee80a9de"

  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip",
      verified: "github.com/App-Fair/"
  name "App Fair"
  desc "The App Fair Catalog Browser"
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