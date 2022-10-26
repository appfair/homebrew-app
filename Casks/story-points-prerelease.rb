cask "story-points-prerelease" do
  version "0.0.6"
  sha256 "e6b3bff7dd943fea8dfab2ee57d61a454bd8c4ddb2f443ed649cd93729352f8c"

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
    "~/Library/Application Scripts/app.Story-Points",
    "~/Library/Application Support/app.Story-Points",
    "~/Library/Caches/app.Story-Points",
    "~/Library/Containers/app.Story-Points",
    "~/Library/HTTPStorages/app.Story-Points",
    "~/Library/HTTPStorages/app.Story-Points.binarycookies",
    "~/Library/Preferences/app.Story-Points.plist",
    "~/Library/Saved Application State/app.Story-Points.savedState"
  ]
end
