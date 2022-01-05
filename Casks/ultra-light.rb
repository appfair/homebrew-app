cask "ultra-light" do
  version "0.0.2"
  sha256 "e3366dccc91b620a92bc47a40050e4eb9c66a4d2fd64018a3c217f9d39a0df69"

  url "https://github.com/Ultra-Light/App/releases/download/#{version}/Ultra-Light-macOS.zip",
      verified: "github.com/Ultra-Light/"
  name "Ultra Light"
  desc "Fork to make an App Fair App"
  homepage "https://github.com/Ultra-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Ultra Light.app", target: "App Fair/Ultra Light.app"
  binary "#{appdir}/App Fair/Ultra Light.app/Contents/MacOS/Ultra Light", target: "ultra-light"

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