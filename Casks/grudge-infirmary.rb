cask "grudge-infirmary" do
  version "0.0.1"
  sha256 "11f2f072723aeddfe71bce8da8d28e62bb10dad5ba7dd3918eee203f0c3ce485"

  url "https://github.com/Grudge-Infirmary/App/releases/download/#{version}/Grudge-Infirmary-macOS.zip",
      verified: "github.com/Grudge-Infirmary/"
  name "Grudge Infirmary"
  desc "Silly demo app"
  homepage "https://github.com/Grudge-Infirmary/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Grudge Infirmary.app", target: "App Fair/Grudge Infirmary.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Grudge Infirmary.app"
  end

  uninstall quit: "app.Grudge-Infirmary"
  zap trash: [
    "~/Library/Caches/app.Grudge-Infirmary",
    "~/Library/Containers/app.Grudge-Infirmary",
    "~/Library/Preferences/app.Grudge-Infirmary.plist",
    "~/Library/Application Scripts/app.Grudge-Infirmary",
    "~/Library/Saved Application State/app.Grudge-Infirmary.savedState",
  ]
end