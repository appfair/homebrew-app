cask "sql-hero" do
  version "0.0.10"
  sha256 "2d6565e233b3a2544b11f22565aa4159750aafa50444fcc6054302078d197aae"

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
    ~/Library/Application Scripts/app.SQL-Hero,
    ~/Library/Application Support/app.SQL-Hero,
    ~/Library/Caches/app.SQL-Hero,
    ~/Library/Containers/app.SQL-Hero,
    ~/Library/HTTPStorages/app.SQL-Hero,
    ~/Library/HTTPStorages/app.SQL-Hero.binarycookies,
    ~/Library/Preferences/app.SQL-Hero.plist,
    ~/Library/Saved Application State/app.SQL-Hero.savedState
  ]
end