cask "cloud-cuckoo" do
  name "Cloud Cuckoo"
  desc "Cloud Cuckoo"
  homepage "https://github.com/Cloud-Cuckoo/App/"
  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  depends_on macos: ">= :monterey"
  version "0.8.83"
  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip"
  sha256 "ee1cdec90ca3f4e3f68adfe4888041c367aad1b57c79b150d90e3634556ddd40"
end