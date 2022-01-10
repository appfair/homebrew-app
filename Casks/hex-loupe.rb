cask "hex-loupe" do
  version "0.0.8"
  sha256 "ca191b9af923ab4f276b1bc024d6f9eff975fe4e1aba6430eb2fc592fea1dfb4"

  url "https://github.com/Hex-Loupe/App/releases/download/#{version}/Hex-Loupe-macOS.zip",
      verified: "github.com/Hex-Loupe/"
  name "Hex Loupe"
  desc "A hex viewer"
  homepage "https://github.com/Hex-Loupe/App/"

  depends_on macos: ">= :monterey"
  

  app "Hex Loupe.app", target: "App Fair/Hex Loupe.app"
  binary "#{appdir}/App Fair/Hex Loupe.app/Contents/MacOS/Hex Loupe", target: "hex-loupe"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Hex Loupe.app"
  end

  zap trash: [
    "~/Library/Caches/app.Hex-Loupe",
    "~/Library/Containers/app.Hex-Loupe",
    "~/Library/Preferences/app.Hex-Loupe.plist",
    "~/Library/Application Scripts/app.Hex-Loupe",
    "~/Library/Saved Application State/app.Hex-Loupe.savedState",
  ]
end