cask "red-light-green-light" do
  version "0.0.11"
  sha256 "9cb85649355c1b9c50c31bcffe489b6c60d2f7c02407239a4bbeef88d84232d7"

  url "https://github.com/Red-Light-Green-Light/App/releases/download/#{version}/Red-Light-Green-Light-macOS.zip",
      verified: "github.com/Red-Light-Green-Light/"
  name "Red Light Green Light"
  desc "무궁화 꽃이 피었습니다"
  homepage "https://github.com/Red-Light-Green-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Red Light Green Light.app", target: "App Fair/Red Light Green Light.app"
  binary "#{appdir}/App Fair/Red Light Green Light.app/Contents/MacOS/Red Light Green Light", target: "red-light-green-light"

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