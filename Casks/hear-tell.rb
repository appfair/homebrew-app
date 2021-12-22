cask "hear-tell" do
  version "0.3.26"
  sha256 "ef89f498025cc22d9aac6afc19016b4d9d6bd2fbb9355c6a31ddf86c2c785825"

  url "https://github.com/Hear-Tell/App/releases/download/#{version}/Hear-Tell-macOS.zip",
      verified: "github.com/Hear-Tell/"
  name "Hear Tell"
  desc "Identify ambient sounds."
  homepage "https://github.com/Hear-Tell/App/"

  depends_on macos: ">= :monterey"
  

  app "Hear Tell.app", target: "App Fair/Hear Tell.app"
  binary "#{appdir}/App Fair/Hear Tell.app/Contents/MacOS/Hear Tell", target: "hear-tell"

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