cask "pan-opticon-prerelease" do
  version "0.0.10"
  sha256 "84297ae90f8565f4b3b174050b781749f63c1fd6dd4c55789ca1b44b53f75751"

  url "https://github.com/Pan-Opticon/App/releases/download/#{version}/Pan-Opticon-macOS.zip",
      verified: "github.com/Pan-Opticon/"
  name "Pan Opticon"
  desc "Watch the Watchers"
  homepage "https://github.com/Pan-Opticon/App/"

  depends_on macos: ">= :monterey"
  

  app "Pan Opticon.app", target: "App Fair/Pan Opticon.app"
  binary "#{appdir}/App Fair/Pan Opticon.app/Contents/MacOS/Pan Opticon", target: "pan-opticon-prerelease"

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