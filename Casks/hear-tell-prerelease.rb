cask "hear-tell-prerelease" do
  version "0.3.31"
  sha256 "190bc16cc58664529509166395f89f62153ead20d76020cabcc4e53cb10b9702"

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