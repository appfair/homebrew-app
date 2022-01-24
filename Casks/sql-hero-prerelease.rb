cask "sql-hero-prerelease" do
  version "0.0.2"
  sha256 "f811827f3620e20f2f9ea529e8b2df08b17c407a53dd5c2cf420009edb237c06"

  url "https://github.com/SQL-Hero/App/releases/download/#{version}/SQL-Hero-macOS.zip",
      verified: "github.com/SQL-Hero/"
  name "SQL Hero"
  desc "Query Like a Boss"
  homepage "https://github.com/SQL-Hero/App/"

  depends_on macos: ">= :monterey"
  

  app "SQL Hero.app", target: "App Fair/SQL Hero.app"
  binary "#{appdir}/App Fair/SQL Hero.app/Contents/MacOS/SQL Hero", target: "sql-hero-prerelease"

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