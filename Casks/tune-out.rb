cask "tune-out" do
  name "Tune Out"
  desc "Tune Out"
  homepage "https://github.com/Tune-Out/App/"
  app "Tune Out.app", target: "App Fair/Tune Out.app"
  depends_on macos: ">= :monterey"
  version "0.8.264"
  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip"
  sha256 "52224e5afdb4ebfaf2d0829d704c15782812bb3d014fdaa8e7bb04819731221b"
end