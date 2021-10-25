cask "app-fair" do
  name "App Fair"
  desc "App Fair"
  homepage "https://github.com/App-Fair/App/"
  app "App Fair.app", target: "App Fair.app"
  depends_on macos: ">= :monterey"
  version "0.6.119"
  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip"
  sha256 "fbf4ce5894b09cc70a6c877356eb4dff2f06b6bf141df1cd7c75ca966ff869d7"
end