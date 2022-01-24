cask "huffle-puff" do
  version "0.0.6"
  sha256 "c2fc4b4785323ce82868401fdba3d63b962ee2a288ebb95a70c3b257ac81ba57"

  url "https://github.com/Huffle-Puff/App/releases/download/#{version}/Huffle-Puff-macOS.zip",
      verified: "github.com/Huffle-Puff/"
  name "Huffle Puff"
  desc "H.R. Huffle Puff "
  homepage "https://github.com/Huffle-Puff/App/"

  depends_on macos: ">= :monterey"
  

  app "Huffle Puff.app", target: "App Fair/Huffle Puff.app"
  binary "#{appdir}/App Fair/Huffle Puff.app/Contents/MacOS/Huffle Puff", target: "huffle-puff"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Huffle Puff.app"
  end

  zap trash: [
    "~/Library/Caches/app.Huffle-Puff",
    "~/Library/Containers/app.Huffle-Puff",
    "~/Library/Preferences/app.Huffle-Puff.plist",
    "~/Library/Application Scripts/app.Huffle-Puff",
    "~/Library/Saved Application State/app.Huffle-Puff.savedState",
  ]
end