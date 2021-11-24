cask "pan-opticon-prerelease" do
  version "0.0.5"
  sha256 "d1dce2e3e024399eb5d5d922a24066e1cb390e3be0f74e9c9300733a5447babd"

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