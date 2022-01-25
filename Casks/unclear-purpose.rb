cask "unclear-purpose" do
  version "0.0.5"
  sha256 "7e52be3c6558eddf0eab2c32d5069a48036241fc6e118570a6b2a0654fcd8a79"

  url "https://github.com/Unclear-Purpose/App/releases/download/#{version}/Unclear-Purpose-macOS.zip",
      verified: "github.com/Unclear-Purpose/"
  name "Unclear Purpose"
  desc "An unclear app"
  homepage "https://github.com/Unclear-Purpose/App/"

  depends_on macos: ">= :monterey"
  

  app "Unclear Purpose.app", target: "App Fair/Unclear Purpose.app"
  binary "#{appdir}/App Fair/Unclear Purpose.app/Contents/MacOS/Unclear Purpose", target: "unclear-purpose"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Unclear Purpose.app"
  end

  zap trash: [
    "~/Library/Caches/app.Unclear-Purpose",
    "~/Library/Containers/app.Unclear-Purpose",
    "~/Library/Preferences/app.Unclear-Purpose.plist",
    "~/Library/Application Scripts/app.Unclear-Purpose",
    "~/Library/Saved Application State/app.Unclear-Purpose.savedState",
  ]
end