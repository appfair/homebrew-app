cask "red-light-green-light-prerelease" do
  version "0.0.12"
  sha256 "9074f553a7b0f8817aa76aa7cd302bb62af52c9fbca7ced06805ddfeab0526d6"

  url "https://github.com/Red-Light-Green-Light/App/releases/download/#{version}/Red-Light-Green-Light-macOS.zip",
      verified: "github.com/Red-Light-Green-Light/"
  name "Red Light Green Light"
  desc "무궁화 꽃이 피었습니다"
  homepage "https://github.com/Red-Light-Green-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Red Light Green Light.app", target: "App Fair/Red Light Green Light.app"
  binary "#{appdir}/App Fair/Red Light Green Light.app/Contents/MacOS/Red Light Green Light", target: "red-light-green-light-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Red Light Green Light.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Red-Light-Green-Light,
    ~/Library/Application Support/app.Red-Light-Green-Light,
    ~/Library/Caches/app.Red-Light-Green-Light,
    ~/Library/Containers/app.Red-Light-Green-Light,
    ~/Library/HTTPStorages/app.Red-Light-Green-Light,
    ~/Library/HTTPStorages/app.Red-Light-Green-Light.binarycookies,
    ~/Library/Preferences/app.Red-Light-Green-Light.plist,
    ~/Library/Saved Application State/app.Red-Light-Green-Light.savedState
  ]
end