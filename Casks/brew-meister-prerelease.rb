cask "brew-meister-prerelease" do
  version "0.0.3"
  sha256 "f196ffb996d8e3bbd9d126c15641fd0ca1dc107938ea9e0bacdcf07017b8b5bf"

  url "https://github.com/Brew-Meister/App/releases/download/#{version}/Brew-Meister-macOS.zip",
      verified: "github.com/Brew-Meister/"
  name "Brew Meister"
  desc "A brew catalog"
  homepage "https://github.com/Brew-Meister/App/"

  depends_on macos: ">= :monterey"
  

  app "Brew Meister.app", target: "App Fair/Brew Meister.app"
  binary "#{appdir}/App Fair/Brew Meister.app/Contents/MacOS/Brew Meister", target: "brew-meister-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Brew Meister.app"
  end

  zap trash: [
    "~/Library/Caches/app.Brew-Meister",
    "~/Library/Containers/app.Brew-Meister",
    "~/Library/Preferences/app.Brew-Meister.plist",
    "~/Library/Application Scripts/app.Brew-Meister",
    "~/Library/Saved Application State/app.Brew-Meister.savedState",
  ]
end