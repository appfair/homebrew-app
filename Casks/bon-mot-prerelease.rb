cask "bon-mot-prerelease" do
  version "1.1.14"
  sha256 "0390289cda4f6147dac6d84bef4bb034b3390c8672a5bc4a6a13964b8169aace"

  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip",
      verified: "github.com/Bon-Mot/"
  name "Bon Mot"
  desc "Book reader"
  homepage "https://github.com/Bon-Mot/App/"

  depends_on macos: ">= :monterey"
  

  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  binary "#{appdir}/App Fair/Bon Mot.app/Contents/MacOS/Bon Mot", target: "bon-mot-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Bon Mot.app"
  end

  zap trash: [
    "~/Library/Caches/app.Bon-Mot",
    "~/Library/Containers/app.Bon-Mot",
    "~/Library/Preferences/app.Bon-Mot.plist",
    "~/Library/Application Scripts/app.Bon-Mot",
    "~/Library/Saved Application State/app.Bon-Mot.savedState",
  ]
end