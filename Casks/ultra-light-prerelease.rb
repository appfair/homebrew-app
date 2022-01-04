cask "ultra-light-prerelease" do
  version "0.0.1"
  sha256 "84063a698fc0137e91c8a2e2422be99faa213632b5bb2ab7804e29840147ce06"

  url "https://github.com/Ultra-Light/App/releases/download/#{version}/Ultra-Light-macOS.zip",
      verified: "github.com/Ultra-Light/"
  name "Ultra Light"
  desc "Fork to make an App Fair App"
  homepage "https://github.com/Ultra-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Ultra Light.app", target: "App Fair/Ultra Light.app"
  binary "#{appdir}/App Fair/Ultra Light.app/Contents/MacOS/Ultra Light", target: "ultra-light-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Ultra Light.app"
  end

  zap trash: [
    "~/Library/Caches/app.Ultra-Light",
    "~/Library/Containers/app.Ultra-Light",
    "~/Library/Preferences/app.Ultra-Light.plist",
    "~/Library/Application Scripts/app.Ultra-Light",
    "~/Library/Saved Application State/app.Ultra-Light.savedState",
  ]
end