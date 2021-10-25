cask "bon-mot" do
  name "Bon Mot"
  desc "Bon Mot"
  homepage "https://github.com/Bon-Mot/App/"
  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  depends_on macos: ">= :monterey"
  version "0.0.21"
  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip"
  sha256 "9d94d9e9015314ce9406271ef0ee3a1de526528b807083f399ce1a81d410f630"
end