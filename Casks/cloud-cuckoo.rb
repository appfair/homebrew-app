cask "cloud-cuckoo" do
  name "Cloud Cuckoo"
  version "0.8.85"
  sha256 "64306d58d04e35b740ec931bd2ba7bc58f5489f51a5aa00243fae8f71c3f9eb7"
  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip"
  desc "Cloud Cuckoo"
  homepage "https://github.com/Cloud-Cuckoo/App/"
  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  depends_on macos: ">= :monterey"
  
  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Cloud Cuckoo.app"
  end
end