cask "tune-out" do
  name "Tune Out"
  desc "The Tune Out app"
  homepage "https://github.com/Tune-Out/App/"
  app "Tune Out.app", target: "App Fair/Tune Out.app"
  version "0.8.258"
  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip"
  sha256 "fcaa781c521cf7e4d67ffaa92d718cf182db3accad6930e64eae1d2740982dc5"
end
