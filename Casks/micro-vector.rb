cask "micro-vector" do
  version "0.0.7"
  sha256 "6ed81ca13fd6d8fde7b05456b52692f8407294b1ad883a97657b947d7db8e98a"

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