cask "tune-out-prerelease" do
  version "0.8.360"
  sha256 "1a5afa38e3932aa4e4bb3fac54102a6145bd39835c6eacfc84e9a6df8d063161"

  url "https://github.com/Tune-Out/App/releases/download/#{version}/Tune-Out-macOS.zip",
      verified: "github.com/Tune-Out/"
  name "Tune Out"
  desc "Stream Internet Radio"
  homepage "https://github.com/Tune-Out/App/"

  depends_on macos: ">= :monterey"
  

  app "Tune Out.app", target: "App Fair/Tune Out.app"
  binary "#{appdir}/App Fair/Tune Out.app/Contents/MacOS/Tune Out", target: "tune-out-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tune Out.app"
  end

  zap trash: [
    "~/Library/Caches/app.Tune-Out",
    "~/Library/Containers/app.Tune-Out",
    "~/Library/Preferences/app.Tune-Out.plist",
    "~/Library/Application Scripts/app.Tune-Out",
    "~/Library/Saved Application State/app.Tune-Out.savedState",
  ]
end