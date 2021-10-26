cask "app-fair" do
  name "App Fair"
  version "0.6.120"
  sha256 "6b4cd1f866c7b0f9bdeba55756976249326d59648879c5206dfece4cf7bbbaf6"
  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip"
  desc "App Fair"
  homepage "https://github.com/App-Fair/App/"
  app "App Fair.app", target: "App Fair.app"
  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"
  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair.app"
  end
end