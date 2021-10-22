cask "app-fair" do
  name "App Fair"
  desc "App Fair"
  homepage "https://github.com/App-Fair/App/"
  app "App Fair.app", target: "App Fair.app"
  depends_on macos: ">= :monterey"
  version "0.6.115"
  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip"
  sha256 "35b735669b23a78082584ba6e3b32fde6ec4ee394bf4bf39a6d9e47fde725e88"
end