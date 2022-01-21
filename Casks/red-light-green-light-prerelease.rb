cask "red-light-green-light-prerelease" do
  version "0.0.4"
  sha256 "43680cf1723054f1e2b36825aa3aa0ed9363b428c78fcc654b74a33e73240edd"

  url "https://github.com/Red-Light-Green-Light/App/releases/download/#{version}/Red-Light-Green-Light-macOS.zip",
      verified: "github.com/Red-Light-Green-Light/"
  name "Red Light Green Light"
  desc "오징어 게임"
  homepage "https://github.com/Red-Light-Green-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Red Light Green Light.app", target: "App Fair/Red Light Green Light.app"
  binary "#{appdir}/App Fair/Red Light Green Light.app/Contents/MacOS/Red Light Green Light", target: "red-light-green-light-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Red Light Green Light.app"
  end

  zap trash: [
    "~/Library/Caches/app.Red-Light-Green-Light",
    "~/Library/Containers/app.Red-Light-Green-Light",
    "~/Library/Preferences/app.Red-Light-Green-Light.plist",
    "~/Library/Application Scripts/app.Red-Light-Green-Light",
    "~/Library/Saved Application State/app.Red-Light-Green-Light.savedState",
  ]
end