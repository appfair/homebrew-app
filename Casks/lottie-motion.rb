cask "lottie-motion" do
  version "0.0.72"
  sha256 "6026b91024b461003a312b614bb65fb0a6b2297d6fa4d448dd678738578443eb"

  url "https://github.com/Lottie-Motion/App/releases/download/#{version}/Lottie-Motion-macOS.zip",
      verified: "github.com/Lottie-Motion/"
  name "Lottie Motion"
  desc "Preview and experiment with Lottie animations"
  homepage "https://github.com/Lottie-Motion/App/"

  depends_on macos: ">= :monterey"
  

  app "Lottie Motion.app", target: "App Fair/Lottie Motion.app"
  binary "#{appdir}/App Fair/Lottie Motion.app/Contents/MacOS/Lottie Motion", target: "lottie-motion"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Lottie Motion.app"
  end

  zap trash: [
    "~/Library/Caches/app.Lottie-Motion",
    "~/Library/Containers/app.Lottie-Motion",
    "~/Library/Preferences/app.Lottie-Motion.plist",
    "~/Library/Application Scripts/app.Lottie-Motion",
    "~/Library/Saved Application State/app.Lottie-Motion.savedState",
  ]
end