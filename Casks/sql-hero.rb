cask "sql-hero" do
  version "0.0.8"
  sha256 "7b7acaf8df44e8d45ff3cd38b9b0273cbe4147d00ded68d55e2608ccc8b2068a"

  url "https://github.com/SQL-Hero/App/releases/download/#{version}/SQL-Hero-macOS.zip",
      verified: "github.com/SQL-Hero/"
  name "SQL Hero"
  desc "Query Like a Boss"
  homepage "https://github.com/SQL-Hero/App/"

  depends_on macos: ">= :monterey"
  

  app "SQL Hero.app", target: "App Fair/SQL Hero.app"
  binary "#{appdir}/App Fair/SQL Hero.app/Contents/MacOS/SQL Hero", target: "sql-hero"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/SQL Hero.app"
  end

  zap trash: [
    "~/Library/Caches/app.SQL-Hero",
    "~/Library/Containers/app.SQL-Hero",
    "~/Library/Preferences/app.SQL-Hero.plist",
    "~/Library/Application Scripts/app.SQL-Hero",
    "~/Library/Saved Application State/app.SQL-Hero.savedState",
  ]
end