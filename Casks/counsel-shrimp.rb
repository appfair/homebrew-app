cask "counsel-shrimp" do
  version "0.0.1"
  sha256 "64d9349f223cb5dac5f239c6a0d5e350a0271049ad678e9438ea05478213caac"

  url "https://github.com/Counsel-Shrimp/App/releases/download/#{version}/Counsel-Shrimp-macOS.zip",
      verified: "github.com/Counsel-Shrimp/"
  name "Counsel Shrimp"
  desc "A silly little game"
  homepage "https://github.com/Counsel-Shrimp/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Counsel Shrimp.app", target: "App Fair/Counsel Shrimp.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Counsel Shrimp.app"
  end

  uninstall quit: "app.Counsel-Shrimp"
  zap trash: [
    "~/Library/Caches/app.Counsel-Shrimp",
    "~/Library/Containers/app.Counsel-Shrimp",
    "~/Library/Preferences/app.Counsel-Shrimp.plist",
    "~/Library/Application Scripts/app.Counsel-Shrimp",
    "~/Library/Saved Application State/app.Counsel-Shrimp.savedState",
  ]
end