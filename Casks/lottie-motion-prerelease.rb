cask "lottie-motion-prerelease" do
  version "0.0.97"
  sha256 "1bdf76dfb1434f0baeb84e2a53f89942739deaf6b66cf06d0c8db04be4b83e63"

  url "https://github.com/Lottie-Motion/App/releases/download/#{version}/Lottie-Motion-macOS.zip",
      verified: "github.com/Lottie-Motion/"
  name "Lottie Motion"
  desc "Preview and experiment with Lottie animations"
  homepage "https://github.com/Lottie-Motion/App/"

  depends_on macos: ">= :monterey"
  

  app "Lottie Motion.app", target: "App Fair/Lottie Motion.app"
  binary "#{appdir}/App Fair/Lottie Motion.app/Contents/MacOS/Lottie Motion", target: "lottie-motion-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Lottie Motion.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Lottie-Motion",
    "~/Library/Application Support/app.Lottie-Motion",
    "~/Library/Caches/app.Lottie-Motion",
    "~/Library/Containers/app.Lottie-Motion",
    "~/Library/HTTPStorages/app.Lottie-Motion",
    "~/Library/HTTPStorages/app.Lottie-Motion.binarycookies",
    "~/Library/Preferences/app.Lottie-Motion.plist",
    "~/Library/Saved Application State/app.Lottie-Motion.savedState"
  ]
end