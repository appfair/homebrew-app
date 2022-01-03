cask "media-res-prerelease" do
  version "0.0.2"
  sha256 "14fd9b9b4ff783e02ee54412c1ac75c28b7c03b9d357e2593c7d5274c9b22607"

  url "https://github.com/Media-Res/App/releases/download/#{version}/Media-Res-macOS.zip",
      verified: "github.com/Media-Res/"
  name "Media Res"
  desc "Art imitating Life (imitating Art)"
  homepage "https://github.com/Media-Res/App/"

  depends_on macos: ">= :monterey"
  

  app "Media Res.app", target: "App Fair/Media Res.app"
  binary "#{appdir}/App Fair/Media Res.app/Contents/MacOS/Media Res", target: "media-res-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Media Res.app"
  end

  zap trash: [
    "~/Library/Caches/app.Media-Res",
    "~/Library/Containers/app.Media-Res",
    "~/Library/Preferences/app.Media-Res.plist",
    "~/Library/Application Scripts/app.Media-Res",
    "~/Library/Saved Application State/app.Media-Res.savedState",
  ]
end