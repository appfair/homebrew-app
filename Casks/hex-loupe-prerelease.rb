cask "hex-loupe-prerelease" do
  version "0.0.19"
  sha256 "a9c42456620c7e1bde3d434d2ccb2d99084168bfa235b22d0a62cc32a916e486"

  url "https://github.com/Hex-Loupe/App/releases/download/#{version}/Hex-Loupe-macOS.zip",
      verified: "github.com/Hex-Loupe/"
  name "Hex Loupe"
  desc "A hex viewer"
  homepage "https://github.com/Hex-Loupe/App/"

  depends_on macos: ">= :monterey"
  

  app "Hex Loupe.app", target: "App Fair/Hex Loupe.app"
  binary "#{appdir}/App Fair/Hex Loupe.app/Contents/MacOS/Hex Loupe", target: "hex-loupe-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Hex Loupe.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Hex-Loupe,
    ~/Library/Application Support/app.Hex-Loupe,
    ~/Library/Caches/app.Hex-Loupe,
    ~/Library/Containers/app.Hex-Loupe,
    ~/Library/HTTPStorages/app.Hex-Loupe,
    ~/Library/HTTPStorages/app.Hex-Loupe.binarycookies,
    ~/Library/Preferences/app.Hex-Loupe.plist,
    ~/Library/Saved Application State/app.Hex-Loupe.savedState
  ]
end