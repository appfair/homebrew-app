cask "cloud-cuckoo" do
  version "0.8.144"
  sha256 "1c6436b246fe5b9d4b85c53a52a3e123629bb3d2255e93f1f1a0926049bbb8bb"

  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip",
      verified: "github.com/Cloud-Cuckoo/"
  name "Cloud Cuckoo"
  desc "A whimsical game of excitement and delight"
  homepage "https://github.com/Cloud-Cuckoo/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  binary "#{appdir}/App Fair/Cloud Cuckoo.app/Contents/MacOS/Cloud Cuckoo", target: "cloud-cuckoo"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Cloud Cuckoo.app"
  end

  zap trash: [
    "~/Library/Caches/app.Cloud-Cuckoo",
    "~/Library/Containers/app.Cloud-Cuckoo",
    "~/Library/Preferences/app.Cloud-Cuckoo.plist",
    "~/Library/Application Scripts/app.Cloud-Cuckoo",
    "~/Library/Saved Application State/app.Cloud-Cuckoo.savedState",
  ]
end