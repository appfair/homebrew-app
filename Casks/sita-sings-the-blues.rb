cask "sita-sings-the-blues" do
  version "0.0.26"
  sha256 "84aac8dd7dd19bbc4724231cdf39f03b7e98ab356218540d1c752bc9f62d86bd"

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
    "~/Library/Caches/app.Sita-Sings-the-Blues",
    "~/Library/Containers/app.Sita-Sings-the-Blues",
    "~/Library/Preferences/app.Sita-Sings-the-Blues.plist",
    "~/Library/Application Scripts/app.Sita-Sings-the-Blues",
    "~/Library/Saved Application State/app.Sita-Sings-the-Blues.savedState",
  ]
end