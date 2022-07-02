cask "app-name-prerelease" do
  version "0.0.1"
  sha256 "c35011df91f87df53050827af45638a1876afdd553b2de4cca238f657b7f74e6"

  url "https://github.com/App-Name/App/releases/download/#{version}/App-Name-macOS.zip",
      verified: "github.com/App-Name/"
  name "App Name"
  desc "A simple but useful app"
  homepage "https://github.com/App-Name/App/"

  depends_on macos: ">= :monterey"
  

  app "App Name.app", target: "App Fair/App Name.app"
  binary "#{appdir}/App Fair/App Name.app/Contents/MacOS/App Name", target: "app-name-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/App Name.app"
  end

  zap trash: [
    "~/Library/Caches/app.App-Name",
    "~/Library/Containers/app.App-Name",
    "~/Library/Preferences/app.App-Name.plist",
    "~/Library/Application Scripts/app.App-Name",
    "~/Library/Saved Application State/app.App-Name.savedState",
  ]
end