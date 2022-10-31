cask "world-fair-prerelease" do
  version "0.0.4"
  sha256 "422a08861c4417e0f6d73f3aff7b0979bc72c81c24d6fa74461d6e81edea3716"

  url "https://github.com/World-Fair/App/releases/download/#{version}/World-Fair-macOS.zip",
      verified: "github.com/World-Fair/"
  name "World Fair"
  desc "An SDUI fairground"
  homepage "https://github.com/World-Fair/App/"

  depends_on macos: ">= :monterey"
  

  app "World Fair.app", target: "App Fair/World Fair.app"
  binary "#{appdir}/App Fair/World Fair.app/Contents/MacOS/World Fair", target: "world-fair-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/World Fair.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.World-Fair",
    "~/Library/Application Support/app.World-Fair",
    "~/Library/Caches/app.World-Fair",
    "~/Library/Containers/app.World-Fair",
    "~/Library/HTTPStorages/app.World-Fair",
    "~/Library/HTTPStorages/app.World-Fair.binarycookies",
    "~/Library/Preferences/app.World-Fair.plist",
    "~/Library/Saved Application State/app.World-Fair.savedState"
  ]
end