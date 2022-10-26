cask "name-sense-prerelease" do
  version "0.0.24"
  sha256 "44460c1912eb428c3c4a1d45791c1fe51d060489640854c73a420b07c4e1f6d8"

  url "https://github.com/Name-Sense/App/releases/download/#{version}/Name-Sense-macOS.zip",
      verified: "github.com/Name-Sense/"
  name "Name Sense"
  desc "A name picking app"
  homepage "https://github.com/Name-Sense/App/"

  depends_on macos: ">= :monterey"
  

  app "Name Sense.app", target: "App Fair/Name Sense.app"
  binary "#{appdir}/App Fair/Name Sense.app/Contents/MacOS/Name Sense", target: "name-sense-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Name Sense.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Name-Sense",
    "~/Library/Application Support/app.Name-Sense",
    "~/Library/Caches/app.Name-Sense",
    "~/Library/Containers/app.Name-Sense",
    "~/Library/HTTPStorages/app.Name-Sense",
    "~/Library/HTTPStorages/app.Name-Sense.binarycookies",
    "~/Library/Preferences/app.Name-Sense.plist",
    "~/Library/Saved Application State/app.Name-Sense.savedState"
  ]
end
