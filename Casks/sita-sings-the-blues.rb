cask "sita-sings-the-blues" do
  version "0.0.51"
  sha256 "16e8b428aa4d98907bede98298c588323a325f41cc33329c37f828f09a1b0d2b"

  url "https://github.com/Sita-Sings-the-Blues/App/releases/download/#{version}/Sita-Sings-the-Blues-macOS.zip",
      verified: "github.com/Sita-Sings-the-Blues/"
  name "Sita Sings the Blues"
  desc "The movie 'Sita Sings the Blues'"
  homepage "https://github.com/Sita-Sings-the-Blues/App/"

  depends_on macos: ">= :monterey"
  

  app "Sita Sings the Blues.app", target: "App Fair/Sita Sings the Blues.app"
  binary "#{appdir}/App Fair/Sita Sings the Blues.app/Contents/MacOS/Sita Sings the Blues", target: "sita-sings-the-blues"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Sita Sings the Blues.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Sita-Sings-the-Blues",
    "~/Library/Application Support/app.Sita-Sings-the-Blues",
    "~/Library/Caches/app.Sita-Sings-the-Blues",
    "~/Library/Containers/app.Sita-Sings-the-Blues",
    "~/Library/HTTPStorages/app.Sita-Sings-the-Blues",
    "~/Library/HTTPStorages/app.Sita-Sings-the-Blues.binarycookies",
    "~/Library/Preferences/app.Sita-Sings-the-Blues.plist",
    "~/Library/Saved Application State/app.Sita-Sings-the-Blues.savedState"
  ]
end