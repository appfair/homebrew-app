cask "yankee-swap" do
  version "0.0.5"
  sha256 "780f5fe8bd893e8303370efec84c0057c3701ed641ffeadf97bef2b56f4a8b0e"

  url "https://github.com/Yankee-Swap/App/releases/download/#{version}/Yankee-Swap-macOS.zip",
      verified: "github.com/Yankee-Swap/"
  name "Yankee Swap"
  desc "Old-time horse trading"
  homepage "https://github.com/Yankee-Swap/App/"

  depends_on macos: ">= :monterey"
  

  app "Yankee Swap.app", target: "App Fair/Yankee Swap.app"
  binary "#{appdir}/App Fair/Yankee Swap.app/Contents/MacOS/Yankee Swap", target: "yankee-swap"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Yankee Swap.app"
  end

  zap trash: [
    "~/Library/Caches/app.Yankee-Swap",
    "~/Library/Containers/app.Yankee-Swap",
    "~/Library/Preferences/app.Yankee-Swap.plist",
    "~/Library/Application Scripts/app.Yankee-Swap",
    "~/Library/Saved Application State/app.Yankee-Swap.savedState",
  ]
end