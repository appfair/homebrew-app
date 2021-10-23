cask "tune-out" do
  name "Tune Out"
  desc "Tune Out"
  homepage "https://github.com/Tune-Out/App/"
  app "Tune Out.app", target: "App Fair/Tune Out.app"
  depends_on macos: ">= :monterey"
  version "0.8.262"
  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip"
  sha256 "3694f637a25e277a73f0ff1ab797323412869aaf1050066227b7e01875ed5ee2"
end