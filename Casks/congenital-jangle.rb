cask "congenital-jangle" do
  version "0.0.5"
  sha256 "db2f4b5f3b164e75c6f1d5e1a9e5f4a6f21fa87a191e4545199647642b995b65"

  url "https://github.com/Congenital-Jangle/App/releases/download/#{version}/Congenital-Jangle-macOS.zip",
      verified: "github.com/Congenital-Jangle/"
  name "Congenital Jangle"
  desc "The app for Jangle Congenital"
  homepage "https://github.com/Congenital-Jangle/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Congenital Jangle.app", target: "App Fair/Congenital Jangle.app"
  

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Congenital Jangle.app"
  end

  uninstall quit: "app.Congenital-Jangle"
  zap trash: [
    "~/Library/Caches/app.Congenital-Jangle",
    "~/Library/Containers/app.Congenital-Jangle",
    "~/Library/Preferences/app.Congenital-Jangle.plist",
    "~/Library/Application Scripts/app.Congenital-Jangle",
    "~/Library/Saved Application State/app.Congenital-Jangle.savedState",
  ]
end