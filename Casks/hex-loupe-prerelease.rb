cask "hex-loupe-prerelease" do
  version "0.0.22"
  sha256 "8cddcf9be6d19ea660afbca8d0837e784443a4e55f56d9c073b35378f540565c"

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
    "~/Library/Application Scripts/app.Hex-Loupe",
    "~/Library/Application Support/app.Hex-Loupe",
    "~/Library/Caches/app.Hex-Loupe",
    "~/Library/Containers/app.Hex-Loupe",
    "~/Library/HTTPStorages/app.Hex-Loupe",
    "~/Library/HTTPStorages/app.Hex-Loupe.binarycookies",
    "~/Library/Preferences/app.Hex-Loupe.plist",
    "~/Library/Saved Application State/app.Hex-Loupe.savedState"
  ]
end