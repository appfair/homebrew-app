cask "app-fair" do
  name "App Fair"
  desc "App Fair"
  homepage "https://github.com/App-Fair/App/"
  app "App Fair.app", target: "App Fair.app"
  depends_on macos: ">= :monterey"
  version "0.6.117"
  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip"
  sha256 "b2daa8bf9a36d884dc8bcffee22307f3f9b64142db95acef6e7dfa1ae03737d3"
end