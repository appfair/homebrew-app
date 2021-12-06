cask "pan-opticon" do
  version "0.2.6"
  sha256 "4f911f018ca9cb6049afdc28511509854da06e666d8fa25a8c4b15f6ae2e9038"

  url "https://github.com/Pan-Opticon/App/releases/download/#{version}/Pan-Opticon-macOS.zip",
      verified: "github.com/Pan-Opticon/"
  name "Pan Opticon"
  desc "Watch the Watchers"
  homepage "https://github.com/Pan-Opticon/App/"

  depends_on macos: ">= :monterey"
  

  app "Pan Opticon.app", target: "App Fair/Pan Opticon.app"
  binary "#{appdir}/App Fair/Pan Opticon.app/Contents/MacOS/Pan Opticon", target: "pan-opticon"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Pan Opticon.app"
  end

  zap trash: [
    "~/Library/Caches/app.Pan-Opticon",
    "~/Library/Containers/app.Pan-Opticon",
    "~/Library/Preferences/app.Pan-Opticon.plist",
    "~/Library/Application Scripts/app.Pan-Opticon",
    "~/Library/Saved Application State/app.Pan-Opticon.savedState",
  ]
end