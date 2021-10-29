cask "progression-mule" do
  version "0.0.1"
  sha256 "54a4f2b0e2aebaeb5eaf080ad62307ea40790fc366204b063c11366b6cee1eb0"

  url "https://github.com/Progression-Mule/App/releases/download/#{version}/Progression-Mule-macOS.zip",
      verified: "github.com/Progression-Mule/"
  name "Progression Mule"
  desc "Yet another demo app"
  homepage "https://github.com/Progression-Mule/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Progression Mule.app", target: "App Fair/Progression Mule.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Progression Mule.app"
  end

  uninstall quit: "app.Progression-Mule"
  zap trash: [
    "~/Library/Caches/app.Progression-Mule",
    "~/Library/Containers/app.Progression-Mule",
    "~/Library/Preferences/app.Progression-Mule.plist",
    "~/Library/Application Scripts/app.Progression-Mule",
    "~/Library/Saved Application State/app.Progression-Mule.savedState",
  ]
end