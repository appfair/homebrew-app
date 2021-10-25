cask "tune-out" do
  name "Tune Out"
  desc "Tune Out"
  homepage "https://github.com/Tune-Out/App/"
  app "Tune Out.app", target: "App Fair/Tune Out.app"
  depends_on macos: ">= :monterey"
  version "0.8.267"
  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip"
  sha256 "4a5519f158eefa2deadba68c1d8772c0a40147138f491eb57274dce11668cc12"
end