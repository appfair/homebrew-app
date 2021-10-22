cask "next-edit" do
  name "Next Edit"
  desc "Next Edit"
  homepage "https://github.com/Next-Edit/App/"
  app "Next Edit.app", target: "App Fair/Next Edit.app"
  depends_on macos: ">= :monterey"
  version "0.0.71"
  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip"
  sha256 "25fad1e9c1d30d1824b1f60969048cc3b906f83cf45115c892158d4bfeff2398"
end