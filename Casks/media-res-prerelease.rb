cask "media-res-prerelease" do
  version "0.0.8"
  sha256 "334324c2e2850cbc53abffe5f99742c505ff22d1cc1505fac3070637e9affb04"

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