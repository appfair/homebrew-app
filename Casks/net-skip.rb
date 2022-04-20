cask "net-skip" do
  version "0.0.33"
  sha256 "33965f1ef8c7655607b7b769bc9bdad06caa9c9df059e15e6a3b3f0f1d175657"

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