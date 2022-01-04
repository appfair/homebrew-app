cask "hear-tell" do
  version "0.3.33"
  sha256 "ad4b6525cd154bf1391a03504c2ad7fa7736873d1887e73c0ec81e27b53a6958"

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