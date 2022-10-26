cask "silly-little-app-prerelease" do
  version "0.0.1"
  sha256 "91e9f817b8f49ba57115b3abe7e327e295f15f4b2b28c3c0f188fc64d1e6f819"

  url "https://github.com/Silly-Little-App/App/releases/download/#{version}/Silly-Little-App-macOS.zip",
      verified: "github.com/Silly-Little-App/"
  name "Silly Little App"
  desc "A simple little app to demonstrate the App Fair"
  homepage "https://github.com/Silly-Little-App/App/"

  depends_on macos: ">= :monterey"
  

  app "Silly Little App.app", target: "App Fair/Silly Little App.app"
  binary "#{appdir}/App Fair/Silly Little App.app/Contents/MacOS/Silly Little App", target: "silly-little-app-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Silly Little App.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Silly-Little-App",
    "~/Library/Application Support/app.Silly-Little-App",
    "~/Library/Caches/app.Silly-Little-App",
    "~/Library/Containers/app.Silly-Little-App",
    "~/Library/HTTPStorages/app.Silly-Little-App",
    "~/Library/HTTPStorages/app.Silly-Little-App.binarycookies",
    "~/Library/Preferences/app.Silly-Little-App.plist",
    "~/Library/Saved Application State/app.Silly-Little-App.savedState"
  ]
end