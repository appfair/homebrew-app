cask "media-res" do
  version "0.0.30"
  sha256 "d1fb61b874ff8a30ed27172dffc63848aeb955a9876624b45b50a4ab52364957"

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
    "~/Library/Application Scripts/app.Media-Res",
    "~/Library/Application Support/app.Media-Res",
    "~/Library/Caches/app.Media-Res",
    "~/Library/Containers/app.Media-Res",
    "~/Library/HTTPStorages/app.Media-Res",
    "~/Library/HTTPStorages/app.Media-Res.binarycookies",
    "~/Library/Preferences/app.Media-Res.plist",
    "~/Library/Saved Application State/app.Media-Res.savedState"
  ]
end