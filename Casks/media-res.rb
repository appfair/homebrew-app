cask "media-res" do
  version "0.0.4"
  sha256 "5c21d5e5a0eb78237b8ffe7f764bb98ae29ed17198f4c0b80f59608dd6831184"

  url "https://github.com/Media-Res/App/releases/download/#{version}/Media-Res-macOS.zip",
      verified: "github.com/Media-Res/"
  name "Media Res"
  desc "Art imitating Life (imitating Art)"
  homepage "https://github.com/Media-Res/App/"

  depends_on macos: ">= :monterey"
  

  app "Media Res.app", target: "App Fair/Media Res.app"
  binary "#{appdir}/App Fair/Media Res.app/Contents/MacOS/Media Res", target: "media-res"

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