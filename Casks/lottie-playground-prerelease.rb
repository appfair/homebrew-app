cask "lottie-playground-prerelease" do
  version "0.0.1"
  sha256 "c6070e9b5ab85d3f799541c938016e793456ec45206622f437f58b522c4b37db"

  url "https://github.com/Lottie-Playground/App/releases/download/#{version}/Lottie-Playground-macOS.zip",
      verified: "github.com/Lottie-Playground/"
  name "Lottie Playground"
  desc "Preview and experiment with Lottie animations"
  homepage "https://github.com/Lottie-Playground/App/"

  depends_on macos: ">= :monterey"
  

  app "Lottie Playground.app", target: "App Fair/Lottie Playground.app"
  binary "#{appdir}/App Fair/Lottie Playground.app/Contents/MacOS/Lottie Playground", target: "lottie-playground-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Lottie Playground.app"
  end

  zap trash: [
    "~/Library/Caches/app.Lottie-Playground",
    "~/Library/Containers/app.Lottie-Playground",
    "~/Library/Preferences/app.Lottie-Playground.plist",
    "~/Library/Application Scripts/app.Lottie-Playground",
    "~/Library/Saved Application State/app.Lottie-Playground.savedState",
  ]
end