cask "story-points-prerelease" do
  version "0.0.1"
  sha256 "8f3de233311e87b953aed5055fad47e335650ce81fb8a5a1bbe74f80189b0983"

  url "https://github.com/Story-Points/App/releases/download/#{version}/Story-Points-macOS.zip",
      verified: "github.com/Story-Points/"
  name "Story Points"
  desc "UX Design Tool"
  homepage "https://github.com/Story-Points/App/"

  depends_on macos: ">= :monterey"
  

  app "Story Points.app", target: "App Fair/Story Points.app"
  binary "#{appdir}/App Fair/Story Points.app/Contents/MacOS/Story Points", target: "story-points-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Story Points.app"
  end

  zap trash: [
    "~/Library/Caches/app.Story-Points",
    "~/Library/Containers/app.Story-Points",
    "~/Library/Preferences/app.Story-Points.plist",
    "~/Library/Application Scripts/app.Story-Points",
    "~/Library/Saved Application State/app.Story-Points.savedState",
  ]
end