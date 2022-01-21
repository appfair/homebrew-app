cask "micro-vector" do
  version "0.0.4"
  sha256 "8c5c08bf51f5d10706c56ec486d5547f5cb3bdc4fb2cc92c7ba24373648583d7"

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