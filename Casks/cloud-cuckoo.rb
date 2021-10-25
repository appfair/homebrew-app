cask "cloud-cuckoo" do
  name "Cloud Cuckoo"
  desc "Cloud Cuckoo"
  homepage "https://github.com/Cloud-Cuckoo/App/"
  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  depends_on macos: ">= :monterey"
  version "0.8.85"
  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip"
  sha256 "64306d58d04e35b740ec931bd2ba7bc58f5489f51a5aa00243fae8f71c3f9eb7"
end