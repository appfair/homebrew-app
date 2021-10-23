cask "cloud-cuckoo" do
  name "Cloud Cuckoo"
  desc "Cloud Cuckoo"
  homepage "https://github.com/Cloud-Cuckoo/App/"
  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  depends_on macos: ">= :monterey"
  version "0.8.82"
  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip"
  sha256 "cb1b47e17f590478e8d125acbabd9d1933f62fb22f8915d45103db1fa3505d14"
end