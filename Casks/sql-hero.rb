cask "sql-hero" do
  version "0.0.6"
  sha256 "20ef62f6febb035079bd03101d4b605d580dc79b71a2e59797d8360df27159f2"

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