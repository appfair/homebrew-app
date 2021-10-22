cask "tune-out" do
  name "Tune Out"
  desc "Tune Out"
  homepage "https://github.com/Tune-Out/App/"
  app "Tune Out.app", target: "App Fair/Tune Out.app"
  depends_on macos: ">= :monterey"
  version "0.8.259"
  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip"
  sha256 "5a4e2fec06e40811e3ba6a93d7cf35c1f681adeb8d16fe77ba93f94a9fca084d"
end