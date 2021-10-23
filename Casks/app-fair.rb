cask "app-fair" do
  name "App Fair"
  desc "App Fair"
  homepage "https://github.com/App-Fair/App/"
  app "App Fair.app", target: "App Fair.app"
  depends_on macos: ">= :monterey"
  version "0.6.116"
  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip"
  sha256 "4d2c30323b21034805c5c8398370588584eb4359a3101f3214263006154fd577"
end