cask "hex-loupe" do
  version "0.0.16"
  sha256 "7c6870088fd822b03e53d612c74cf473e6b3b7b9c4f74bd722695032aa50f58b"

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