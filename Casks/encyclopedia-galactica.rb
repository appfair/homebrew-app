cask "encyclopedia-galactica" do
  version "0.0.23"
  sha256 "dcfe892beeeadbad9aa116afc915a105ba22390c5e85829fcf63428f05029ea3"

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
    "~/Library/Caches/app.Encyclopedia-Galactica",
    "~/Library/Containers/app.Encyclopedia-Galactica",
    "~/Library/Preferences/app.Encyclopedia-Galactica.plist",
    "~/Library/Application Scripts/app.Encyclopedia-Galactica",
    "~/Library/Saved Application State/app.Encyclopedia-Galactica.savedState",
  ]
end