cask "appdemoxixxi" do
  version "0.0.9"
  sha256 "9829b601585a8a3cefa5d9613bd7263c88870def3021c79b7de499081318648f"

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