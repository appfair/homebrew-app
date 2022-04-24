cask "net-skip" do
  version "0.0.35"
  sha256 "2dc6cc85067465421a74eda518315f8374411d41a05801e11ee217c834637fc8"

  url "https://github.com/Net-Skip/App/releases/download/#{version}/Net-Skip-macOS.zip",
      verified: "github.com/Net-Skip/"
  name "Net Skip"
  desc "Web browsing for the connoisseur"
  homepage "https://github.com/Net-Skip/App/"

  depends_on macos: ">= :monterey"
  

  app "Net Skip.app", target: "App Fair/Net Skip.app"
  binary "#{appdir}/App Fair/Net Skip.app/Contents/MacOS/Net Skip", target: "net-skip"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Net Skip.app"
  end

  zap trash: [
    "~/Library/Caches/app.Net-Skip",
    "~/Library/Containers/app.Net-Skip",
    "~/Library/Preferences/app.Net-Skip.plist",
    "~/Library/Application Scripts/app.Net-Skip",
    "~/Library/Saved Application State/app.Net-Skip.savedState",
  ]
end