cask "bon-mot" do
  name "Bon Mot"
  desc "Bon Mot"
  homepage "https://github.com/Bon-Mot/App/"
  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  depends_on macos: ">= :monterey"
  version "0.0.16"
  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip"
  sha256 "087e9b879a20cfb564469f48f6cf82a5c77aa5ac842f6b773604178282fce132"
end