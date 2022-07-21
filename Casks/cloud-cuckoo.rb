cask "cloud-cuckoo" do
  version "0.9.137"
  sha256 "23edd6a9bc07a04139fcecbafd67b767f99410a1c80d08e14ee9e5e121463f71"

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