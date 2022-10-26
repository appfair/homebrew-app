cask "huffle-puff" do
  version "0.0.10"
  sha256 "e0d9377f5a4e63ee5ded33fc62f2fd9cbf64a98f68fe967efcc99333a8780b97"

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
    "~/Library/Application Scripts/app.Huffle-Puff",
    "~/Library/Application Support/app.Huffle-Puff",
    "~/Library/Caches/app.Huffle-Puff",
    "~/Library/Containers/app.Huffle-Puff",
    "~/Library/HTTPStorages/app.Huffle-Puff",
    "~/Library/HTTPStorages/app.Huffle-Puff.binarycookies",
    "~/Library/Preferences/app.Huffle-Puff.plist",
    "~/Library/Saved Application State/app.Huffle-Puff.savedState"
  ]
end