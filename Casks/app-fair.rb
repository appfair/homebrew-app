cask "app-fair" do
  version "0.6.138"
  sha256 "a656a6591754504ea225ce693d650f9937d3e000ae1919e27d9b05e59c6cd54b"

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

  uninstall quit: "app.App-Fair"
  zap trash: [
    "~/Library/Caches/app.App-Fair",
    "~/Library/Containers/app.App-Fair",
    "~/Library/Preferences/app.App-Fair.plist",
    "~/Library/Application Scripts/app.App-Fair",
    "~/Library/Saved Application State/app.App-Fair.savedState",
  ]
end