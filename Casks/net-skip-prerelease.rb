cask "net-skip-prerelease" do
  version "0.0.10"
  sha256 "cba5ba4e8ff3767598663a251156b2b53d3c668470689d1e7a312edb6599548c"

  url "https://github.com/Net-Skip/App/releases/download/#{version}/Net-Skip-macOS.zip",
      verified: "github.com/Net-Skip/"
  name "Net Skip"
  desc "Web browsing for the connoisseur"
  homepage "https://github.com/Net-Skip/App/"

  depends_on macos: ">= :monterey"
  

  app "Net Skip.app", target: "App Fair/Net Skip.app"
  binary "#{appdir}/App Fair/Net Skip.app/Contents/MacOS/Net Skip", target: "net-skip-prerelease"

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