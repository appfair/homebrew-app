cask "coin-toss" do
  name "Coin Toss"
  desc "Coin Toss"
  homepage "https://github.com/Coin-Toss/App/"
  app "Coin Toss.app", target: "App Fair/Coin Toss.app"
  depends_on macos: ">= :monterey"
  version "0.0.4"
  url "https://github.com/Coin-Toss/App/releases/download/#{version}/Coin-Toss-macOS.zip"
  sha256 "50245bc5be3fceee253430a21aaa2a0fd60907b6422c495db530c785b11c77a5"
end