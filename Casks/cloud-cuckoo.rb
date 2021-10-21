cask "cloud-cuckoo" do
  name "Clous Cuckoo"
  desc "The Cloud Cuckoo app"
  homepage "https://github.com/Cloud-Cuckoo/App/"
  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  depends_on cask: "app-fair"
  version "0.8.81"
  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip"
  sha256 "fcaa781c521cf7e4d67ffaa92d718cf182db3accad6930e64eae1d2740982dc5"
end
