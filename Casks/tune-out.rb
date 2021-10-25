cask "tune-out" do
  name "Tune Out"
  desc "Tune Out"
  homepage "https://github.com/Tune-Out/App/"
  app "Tune Out.app", target: "App Fair/Tune Out.app"
  depends_on macos: ">= :monterey"
  version "0.8.266"
  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip"
  sha256 "920fb50284ad09b482aa8416a39b5983957b9f25213dfe07e4a95af70fbcca76"
end