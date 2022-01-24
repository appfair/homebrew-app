cask "micro-vector" do
  version "0.0.5"
  sha256 "4ecfc1dcf3ee811c7e2df6b27083f06586b3c9545709975c0d28798fa2c4b153"

  url "https://github.com/Micro-Vector/App/releases/download/#{version}/Micro-Vector-macOS.zip",
      verified: "github.com/Micro-Vector/"
  name "Micro Vector"
  desc "A vector drawing app"
  homepage "https://github.com/Micro-Vector/App/"

  depends_on macos: ">= :monterey"
  

  app "Micro Vector.app", target: "App Fair/Micro Vector.app"
  binary "#{appdir}/App Fair/Micro Vector.app/Contents/MacOS/Micro Vector", target: "micro-vector"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Micro Vector.app"
  end

  zap trash: [
    "~/Library/Caches/app.Micro-Vector",
    "~/Library/Containers/app.Micro-Vector",
    "~/Library/Preferences/app.Micro-Vector.plist",
    "~/Library/Application Scripts/app.Micro-Vector",
    "~/Library/Saved Application State/app.Micro-Vector.savedState",
  ]
end