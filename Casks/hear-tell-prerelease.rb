cask "hear-tell-prerelease" do
  version "0.2.20"
  sha256 "5efe628984e4fb59376da6a889900b4a4bddc145c958f078733d1dee1a825e17"

  url "https://github.com/Hear-Tell/App/releases/download/#{version}/Hear-Tell-macOS.zip",
      verified: "github.com/Hear-Tell/"
  name "Hear Tell"
  desc "Identify ambient sounds."
  homepage "https://github.com/Hear-Tell/App/"

  depends_on macos: ">= :monterey"
  

  app "Hear Tell.app", target: "App Fair/Hear Tell.app"
  binary "#{appdir}/App Fair/Hear Tell.app/Contents/MacOS/Hear Tell", target: "hear-tell-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Hear Tell.app"
  end

  zap trash: [
    "~/Library/Caches/app.Hear-Tell",
    "~/Library/Containers/app.Hear-Tell",
    "~/Library/Preferences/app.Hear-Tell.plist",
    "~/Library/Application Scripts/app.Hear-Tell",
    "~/Library/Saved Application State/app.Hear-Tell.savedState",
  ]
end