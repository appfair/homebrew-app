cask "fox-glove-prerelease" do
  version "0.0.1"
  sha256 "b6422a300d3f278b246a7e28f549a60c3d07e2c519f11f184af2809fb933f6b8"

  url "https://github.com/Fox-Glove/App/releases/download/#{version}/Fox-Glove-macOS.zip",
      verified: "github.com/Fox-Glove/"
  name "Fox Glove"
  desc "There, I fixed the web for you. You're welcome."
  homepage "https://github.com/Fox-Glove/App/"

  depends_on macos: ">= :monterey"
  

  app "Fox Glove.app", target: "App Fair/Fox Glove.app"
  binary "#{appdir}/App Fair/Fox Glove.app/Contents/MacOS/Fox Glove", target: "fox-glove-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Fox Glove.app"
  end

  zap trash: [
    "~/Library/Caches/app.Fox-Glove",
    "~/Library/Containers/app.Fox-Glove",
    "~/Library/Preferences/app.Fox-Glove.plist",
    "~/Library/Application Scripts/app.Fox-Glove",
    "~/Library/Saved Application State/app.Fox-Glove.savedState",
  ]
end