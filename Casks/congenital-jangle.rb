cask "congenital-jangle" do
  version "0.0.4"
  sha256 "f036ba498d5a6ef66ffbf0d9508879fd278300c460fd1475baf8ac450f2621c0"

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