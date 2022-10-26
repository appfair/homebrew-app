cask "yankee-swap-prerelease" do
  version "0.0.11"
  sha256 "939c72e726019d26d6d225dd5a6d3d099a7aa662e65b82ff91ce268acb5e40a7"

  url "https://github.com/Yankee-Swap/App/releases/download/#{version}/Yankee-Swap-macOS.zip",
      verified: "github.com/Yankee-Swap/"
  name "Yankee Swap"
  desc "Old-time horse trading"
  homepage "https://github.com/Yankee-Swap/App/"

  depends_on macos: ">= :monterey"
  

  app "Yankee Swap.app", target: "App Fair/Yankee Swap.app"
  binary "#{appdir}/App Fair/Yankee Swap.app/Contents/MacOS/Yankee Swap", target: "yankee-swap-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Yankee Swap.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Yankee-Swap",
    "~/Library/Application Support/app.Yankee-Swap",
    "~/Library/Caches/app.Yankee-Swap",
    "~/Library/Containers/app.Yankee-Swap",
    "~/Library/HTTPStorages/app.Yankee-Swap",
    "~/Library/HTTPStorages/app.Yankee-Swap.binarycookies",
    "~/Library/Preferences/app.Yankee-Swap.plist",
    "~/Library/Saved Application State/app.Yankee-Swap.savedState"
  ]
end
