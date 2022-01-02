cask "sita-sings-the-blues" do
  version "0.0.21"
  sha256 "42412a33baa03d9e62e3be192f21b93a23d330211d26382dafa9df4891c96b65"

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