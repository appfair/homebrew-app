cask "next-edit" do
  name "Next Edit"
  version "0.0.71"
  sha256 "25fad1e9c1d30d1824b1f60969048cc3b906f83cf45115c892158d4bfeff2398"
  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip"
  desc "Next Edit"
  homepage "https://github.com/Next-Edit/App/"
  app "Next Edit.app", target: "App Fair/Next Edit.app"
  depends_on macos: ">= :monterey"
  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Next Edit.app"
  end
end