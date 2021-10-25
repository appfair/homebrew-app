cask "bon-mot" do
  name "Bon Mot"
  desc "Bon Mot"
  homepage "https://github.com/Bon-Mot/App/"
  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  depends_on macos: ">= :monterey"
  version "0.0.18"
  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip"
  sha256 "9e39a29e0643b1591fecbd6d8f124890f6b88a468b3bbbe2d816addb9ac2f6e6"
end