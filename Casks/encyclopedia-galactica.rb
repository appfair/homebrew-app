cask "encyclopedia-galactica" do
  version "0.1.65"
  sha256 "0eb7b2f11f050203bbb282d1b8d2c2f106a721b9df81d68cb32be8a11856470f"

  url "https://github.com/Encyclopedia-Galactica/App/releases/download/#{version}/Encyclopedia-Galactica-macOS.zip",
      verified: "github.com/Encyclopedia-Galactica/"
  name "Encyclopedia Galactica"
  desc "All the accumulated knowledge in the galaxy"
  homepage "https://github.com/Encyclopedia-Galactica/App/"

  depends_on macos: ">= :monterey"
  

  app "Encyclopedia Galactica.app", target: "App Fair/Encyclopedia Galactica.app"
  binary "#{appdir}/App Fair/Encyclopedia Galactica.app/Contents/MacOS/Encyclopedia Galactica", target: "encyclopedia-galactica"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Encyclopedia Galactica.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Encyclopedia-Galactica,
    ~/Library/Application Support/app.Encyclopedia-Galactica,
    ~/Library/Caches/app.Encyclopedia-Galactica,
    ~/Library/Containers/app.Encyclopedia-Galactica,
    ~/Library/HTTPStorages/app.Encyclopedia-Galactica,
    ~/Library/HTTPStorages/app.Encyclopedia-Galactica.binarycookies,
    ~/Library/Preferences/app.Encyclopedia-Galactica.plist,
    ~/Library/Saved Application State/app.Encyclopedia-Galactica.savedState
  ]
end