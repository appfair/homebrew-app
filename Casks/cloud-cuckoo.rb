cask "cloud-cuckoo" do
  version "0.9.2"
  sha256 "77ed0d127dd636e41577ac5fbb1a610171c4c22e1bada55b459f3fe6ff2b3de6"

  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip",
      verified: "github.com/Cloud-Cuckoo/"
  name "Cloud Cuckoo"
  desc "A whimsical game of excitement and delight"
  homepage "https://github.com/Cloud-Cuckoo/App/"

  depends_on macos: ">= :monterey"
  

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