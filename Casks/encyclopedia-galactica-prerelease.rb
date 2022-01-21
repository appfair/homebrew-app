cask "encyclopedia-galactica-prerelease" do
  version "0.0.29"
  sha256 "b6af54f733a2a4b00798b18edd78cd5ef5564425589a79ffd2ad098b3692c1f5"

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