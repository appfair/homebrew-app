cask "fair-skies-prerelease" do
  version "0.0.1"
  sha256 "789c2a8a06c814c3212a38c6bf98dad2ed10de0ed42405db92a941f3cbeb3e91"

  url "https://github.com/Fair-Skies/App/releases/download/#{version}/Fair-Skies-macOS.zip",
      verified: "github.com/Fair-Skies/"
  name "Fair Skies"
  desc "An app for weather bugs"
  homepage "https://github.com/Fair-Skies/App/"

  depends_on macos: ">= :monterey"
  

  app "Fair Skies.app", target: "App Fair/Fair Skies.app"
  binary "#{appdir}/App Fair/Fair Skies.app/Contents/MacOS/Fair Skies", target: "fair-skies-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Fair Skies.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Fair-Skies,
    ~/Library/Application Support/app.Fair-Skies,
    ~/Library/Caches/app.Fair-Skies,
    ~/Library/Containers/app.Fair-Skies,
    ~/Library/HTTPStorages/app.Fair-Skies,
    ~/Library/HTTPStorages/app.Fair-Skies.binarycookies,
    ~/Library/Preferences/app.Fair-Skies.plist,
    ~/Library/Saved Application State/app.Fair-Skies.savedState
  ]
end