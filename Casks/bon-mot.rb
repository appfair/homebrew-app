cask "bon-mot" do
  name "Bon Mot"
  desc "Bon Mot"
  homepage "https://github.com/Bon-Mot/App/"
  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  depends_on macos: ">= :monterey"
  version "0.0.17"
  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip"
  sha256 "282759d92f2c21ec6f6c2e549e16286c4bd9a1b668981c20a170378306ee52e2"
end