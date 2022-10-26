cask "fair-skies" do
  version "0.0.5"
  sha256 "d8b76c8ee8380f0a28bdf3de6c6e812b22866f4a09e05d6e4b1071ebae1170e4"

  url "https://github.com/Fair-Skies/App/releases/download/#{version}/Fair-Skies-macOS.zip",
      verified: "github.com/Fair-Skies/"
  name "Fair Skies"
  desc "An app for weather bugs"
  homepage "https://github.com/Fair-Skies/App/"

  depends_on macos: ">= :monterey"
  

  app "Fair Skies.app", target: "App Fair/Fair Skies.app"
  binary "#{appdir}/App Fair/Fair Skies.app/Contents/MacOS/Fair Skies", target: "fair-skies"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Fair Skies.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Fair-Skies",
    "~/Library/Application Support/app.Fair-Skies",
    "~/Library/Caches/app.Fair-Skies",
    "~/Library/Containers/app.Fair-Skies",
    "~/Library/HTTPStorages/app.Fair-Skies",
    "~/Library/HTTPStorages/app.Fair-Skies.binarycookies",
    "~/Library/Preferences/app.Fair-Skies.plist",
    "~/Library/Saved Application State/app.Fair-Skies.savedState"
  ]
end
