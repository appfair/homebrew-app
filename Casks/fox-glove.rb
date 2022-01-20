cask "fox-glove" do
  version "0.0.2"
  sha256 "6c0323b39d03a4dc5e294126f6a32cae74e51a07959be42b43f32b20d3018e49"

  url "https://github.com/Fox-Glove/App/releases/download/#{version}/Fox-Glove-macOS.zip",
      verified: "github.com/Fox-Glove/"
  name "Fox Glove"
  desc "There, I fixed the web for you. You're welcome."
  homepage "https://github.com/Fox-Glove/App/"

  depends_on macos: ">= :monterey"
  

  app "Fox Glove.app", target: "App Fair/Fox Glove.app"
  binary "#{appdir}/App Fair/Fox Glove.app/Contents/MacOS/Fox Glove", target: "fox-glove"

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