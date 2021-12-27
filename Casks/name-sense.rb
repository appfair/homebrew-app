cask "name-sense" do
  version "0.0.12"
  sha256 "8d98bf5d32d0a2d97458caaf9490e7e85028d618b7b998db403b36e6a48406a1"

  url "https://github.com/Name-Sense/App/releases/download/#{version}/Name-Sense-macOS.zip",
      verified: "github.com/Name-Sense/"
  name "Name Sense"
  desc "Fork to make an App Fair App"
  homepage "https://github.com/Name-Sense/App/"

  depends_on macos: ">= :monterey"
  

  app "Name Sense.app", target: "App Fair/Name Sense.app"
  binary "#{appdir}/App Fair/Name Sense.app/Contents/MacOS/Name Sense", target: "name-sense"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Name Sense.app"
  end

  zap trash: [
    "~/Library/Caches/app.Name-Sense",
    "~/Library/Containers/app.Name-Sense",
    "~/Library/Preferences/app.Name-Sense.plist",
    "~/Library/Application Scripts/app.Name-Sense",
    "~/Library/Saved Application State/app.Name-Sense.savedState",
  ]
end