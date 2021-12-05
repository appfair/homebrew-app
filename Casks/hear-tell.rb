cask "hear-tell" do
  version "0.3.16"
  sha256 "a4a4bdb14f4d9ddcfe3442d47e30563f43cac0036d9f05a40e4c6f59dd8c68f5"

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