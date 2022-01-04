cask "crazy-glue-prerelease" do
  version "0.0.1"
  sha256 "be451e94631255d8d71c4df7ed99b06175da6d1e57210fa57b3b79d6a7d16cb0"

  url "https://github.com/Crazy-Glue/App/releases/download/#{version}/Crazy-Glue-macOS.zip",
      verified: "github.com/Crazy-Glue/"
  name "Crazy Glue"
  desc "Putting the pieces back together"
  homepage "https://github.com/Crazy-Glue/App/"

  depends_on macos: ">= :monterey"
  

  app "Crazy Glue.app", target: "App Fair/Crazy Glue.app"
  binary "#{appdir}/App Fair/Crazy Glue.app/Contents/MacOS/Crazy Glue", target: "crazy-glue-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Crazy Glue.app"
  end

  zap trash: [
    "~/Library/Caches/app.Crazy-Glue",
    "~/Library/Containers/app.Crazy-Glue",
    "~/Library/Preferences/app.Crazy-Glue.plist",
    "~/Library/Application Scripts/app.Crazy-Glue",
    "~/Library/Saved Application State/app.Crazy-Glue.savedState",
  ]
end