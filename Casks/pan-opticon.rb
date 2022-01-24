cask "pan-opticon" do
  version "0.2.22"
  sha256 "6f6765b12411f568825a8def3d0187ca12f2d3d1f9ce62edc8dc6d8c4151fce8"

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