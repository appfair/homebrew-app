cask "crazy-glue" do
  version "0.0.7"
  sha256 "e1deb5fa716d43bf3f8db9f06f84b45ce809012261a6355aae6944f3fa7b1fdc"

  url "https://github.com/Crazy-Glue/App/releases/download/#{version}/Crazy-Glue-macOS.zip",
      verified: "github.com/Crazy-Glue/"
  name "Crazy Glue"
  desc "Putting the pieces back together"
  homepage "https://github.com/Crazy-Glue/App/"

  depends_on macos: ">= :monterey"
  

  app "Crazy Glue.app", target: "App Fair/Crazy Glue.app"
  binary "#{appdir}/App Fair/Crazy Glue.app/Contents/MacOS/Crazy Glue", target: "crazy-glue"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Crazy Glue.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Crazy-Glue",
    "~/Library/Application Support/app.Crazy-Glue",
    "~/Library/Caches/app.Crazy-Glue",
    "~/Library/Containers/app.Crazy-Glue",
    "~/Library/HTTPStorages/app.Crazy-Glue",
    "~/Library/HTTPStorages/app.Crazy-Glue.binarycookies",
    "~/Library/Preferences/app.Crazy-Glue.plist",
    "~/Library/Saved Application State/app.Crazy-Glue.savedState"
  ]
end
