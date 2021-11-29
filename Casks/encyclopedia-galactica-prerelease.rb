cask "encyclopedia-galactica-prerelease" do
  version "0.0.9"
  sha256 "eb8b5c589fc49b7ec699aa6ac30f33b42ddc6922d089931c5bf51acb2aede3f6"

  url "https://github.com/Encyclopedia-Galactica/App/releases/download/#{version}/Encyclopedia-Galactica-macOS.zip",
      verified: "github.com/Encyclopedia-Galactica/"
  name "Encyclopedia Galactica"
  desc "All the accumulated knowledge in the galaxy"
  homepage "https://github.com/Encyclopedia-Galactica/App/"

  depends_on macos: ">= :monterey"
  

  app "Encyclopedia Galactica.app", target: "App Fair/Encyclopedia Galactica.app"
  binary "#{appdir}/App Fair/Encyclopedia Galactica.app/Contents/MacOS/Encyclopedia Galactica", target: "encyclopedia-galactica-prerelease"

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