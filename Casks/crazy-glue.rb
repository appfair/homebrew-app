cask "crazy-glue" do
  version "0.0.3"
  sha256 "db6d1cd0fb1a6410fe566839908631778acf6f0e810123a3cbbae42952d815d4"

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
    "~/Library/Caches/app.Crazy-Glue",
    "~/Library/Containers/app.Crazy-Glue",
    "~/Library/Preferences/app.Crazy-Glue.plist",
    "~/Library/Application Scripts/app.Crazy-Glue",
    "~/Library/Saved Application State/app.Crazy-Glue.savedState",
  ]
end