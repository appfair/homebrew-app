cask "net-skip" do
  version "0.0.45"
  sha256 "0c7d2890822b73ea7f0e575799e0996db82f769638373d633aaa0acd83eda827"

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
    ~/Library/Application Scripts/app.Net-Skip,
    ~/Library/Application Support/app.Net-Skip,
    ~/Library/Caches/app.Net-Skip,
    ~/Library/Containers/app.Net-Skip,
    ~/Library/HTTPStorages/app.Net-Skip,
    ~/Library/HTTPStorages/app.Net-Skip.binarycookies,
    ~/Library/Preferences/app.Net-Skip.plist,
    ~/Library/Saved Application State/app.Net-Skip.savedState
  ]
end