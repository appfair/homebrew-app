cask "cloud-cuckoo-prerelease" do
  version "0.9.224"
  sha256 "3f5b370201326a1583073456047f4008d553469011e779edc33164c074514659"

  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip",
      verified: "github.com/Cloud-Cuckoo/"
  name "Cloud Cuckoo"
  desc "A whimsical game of excitement and delight"
  homepage "https://github.com/Cloud-Cuckoo/App/"

  depends_on macos: ">= :monterey"
  

  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  binary "#{appdir}/App Fair/Cloud Cuckoo.app/Contents/MacOS/Cloud Cuckoo", target: "cloud-cuckoo-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Cloud Cuckoo.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Cloud-Cuckoo,
    ~/Library/Application Support/app.Cloud-Cuckoo,
    ~/Library/Caches/app.Cloud-Cuckoo,
    ~/Library/Containers/app.Cloud-Cuckoo,
    ~/Library/HTTPStorages/app.Cloud-Cuckoo,
    ~/Library/HTTPStorages/app.Cloud-Cuckoo.binarycookies,
    ~/Library/Preferences/app.Cloud-Cuckoo.plist,
    ~/Library/Saved Application State/app.Cloud-Cuckoo.savedState
  ]
end