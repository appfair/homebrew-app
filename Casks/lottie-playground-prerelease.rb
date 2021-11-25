cask "lottie-playground-prerelease" do
  version "0.0.13"
  sha256 "15b4b236e922ffb3696330f8836378c145a0ebfa1a17e5b8dc57266bd0416f53"

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