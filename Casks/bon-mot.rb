cask "bon-mot" do
  name "Bon Mot"
  desc "Bon Mot"
  homepage "https://github.com/Bon-Mot/App/"
  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  depends_on macos: ">= :monterey"
  version "0.0.7"
  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip"
  sha256 "a4142783bd84c819d238cb5fc93aebc971041de853b5517c601f149aeb0adf5c"
end