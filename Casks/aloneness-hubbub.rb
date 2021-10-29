cask "aloneness-hubbub" do
  version "0.0.1"
  sha256 "17b5a4d778b560f1dbc91d5ec4fb7ea166d9a03da4bae9823f69b6f6e864d16d"

  url "https://github.com/Aloneness-Hubbub/App/releases/download/#{version}/Aloneness-Hubbub-macOS.zip",
      verified: "github.com/Aloneness-Hubbub/"
  name "Aloneness Hubbub"
  desc "Another day, another demo"
  homepage "https://github.com/Aloneness-Hubbub/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Aloneness Hubbub.app", target: "App Fair/Aloneness Hubbub.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Aloneness Hubbub.app"
  end

  uninstall quit: "app.Aloneness-Hubbub"
  zap trash: [
    "~/Library/Caches/app.Aloneness-Hubbub",
    "~/Library/Containers/app.Aloneness-Hubbub",
    "~/Library/Preferences/app.Aloneness-Hubbub.plist",
    "~/Library/Application Scripts/app.Aloneness-Hubbub",
    "~/Library/Saved Application State/app.Aloneness-Hubbub.savedState",
  ]
end