cask "appdemoxixxi" do
  version "0.0.8"
  sha256 "479dba16043557411337f803eeee72d24491e5f1a6fe76144e81a5a49ffc9e1e"

  url "https://github.com/AppDemoXIXXI/App/releases/download/#{version}/AppDemoXIXXI-macOS.zip",
      verified: "github.com/AppDemoXIXXI/"
  name "AppDemoXIXXI"
  desc "A simple single-word app"
  homepage "https://github.com/AppDemoXIXXI/App/"

  depends_on macos: ">= :monterey"
  

  app "AppDemoXIXXI.app", target: "App Fair/AppDemoXIXXI.app"
  binary "#{appdir}/App Fair/AppDemoXIXXI.app/Contents/MacOS/AppDemoXIXXI", target: "appdemoxixxi"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/AppDemoXIXXI.app"
  end

  zap trash: [
    "~/Library/Caches/app.AppDemoXIXXI",
    "~/Library/Containers/app.AppDemoXIXXI",
    "~/Library/Preferences/app.AppDemoXIXXI.plist",
    "~/Library/Application Scripts/app.AppDemoXIXXI",
    "~/Library/Saved Application State/app.AppDemoXIXXI.savedState",
  ]
end