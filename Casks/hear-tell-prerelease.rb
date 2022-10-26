cask "hear-tell-prerelease" do
  version "0.3.38"
  sha256 "637b46022cb1ac3b100471d8f7dff1cba01a1d552369f927e5eefa3ded6c93bc"

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
    "~/Library/Application Scripts/app.Hear-Tell",
    "~/Library/Application Support/app.Hear-Tell",
    "~/Library/Caches/app.Hear-Tell",
    "~/Library/Containers/app.Hear-Tell",
    "~/Library/HTTPStorages/app.Hear-Tell",
    "~/Library/HTTPStorages/app.Hear-Tell.binarycookies",
    "~/Library/Preferences/app.Hear-Tell.plist",
    "~/Library/Saved Application State/app.Hear-Tell.savedState"
  ]
end