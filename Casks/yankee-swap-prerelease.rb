cask "yankee-swap-prerelease" do
  version "0.0.1"
  sha256 "75e900dcf12fa255c72d48ccdd38cab7587632b818b8ad68a6e1de0e19b41488"

  url "https://github.com/Yankee-Swap/App/releases/download/#{version}/Yankee-Swap-macOS.zip",
      verified: "github.com/Yankee-Swap/"
  name "Yankee Swap"
  desc "Social swap"
  homepage "https://github.com/Yankee-Swap/App/"

  depends_on macos: ">= :monterey"
  

  app "Yankee Swap.app", target: "App Fair/Yankee Swap.app"
  binary "#{appdir}/App Fair/Yankee Swap.app/Contents/MacOS/Yankee Swap", target: "yankee-swap-prerelease"

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