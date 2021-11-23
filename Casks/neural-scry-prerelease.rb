cask "neural-scry-prerelease" do
  version "0.0.20"
  sha256 "6bda86dfa82c0e474c6b2093cc04cb10e89b606d2502a4811fb83969a3b75db0"

  url "https://github.com/Neural-Scry/App/releases/download/#{version}/Neural-Scry-macOS.zip",
      verified: "github.com/Neural-Scry/"
  name "Neural Scry"
  desc "Look into the minds of others"
  homepage "https://github.com/Neural-Scry/App/"

  depends_on macos: ">= :monterey"
  

  app "Neural Scry.app", target: "App Fair/Neural Scry.app"
  binary "#{appdir}/App Fair/Neural Scry.app/Contents/MacOS/Neural Scry", target: "neural-scry-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Neural Scry.app"
  end

  zap trash: [
    "~/Library/Caches/app.Neural-Scry",
    "~/Library/Containers/app.Neural-Scry",
    "~/Library/Preferences/app.Neural-Scry.plist",
    "~/Library/Application Scripts/app.Neural-Scry",
    "~/Library/Saved Application State/app.Neural-Scry.savedState",
  ]
end