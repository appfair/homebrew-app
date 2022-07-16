cask "next-edit" do
  version "0.4.18"
  sha256 "6ee478349595968078112b52bbde2bf14753271fd31531bea7c0bca10977d28a"

  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip",
      verified: "github.com/Next-Edit/"
  name "Next Edit"
  desc "Syntactic Text Editor"
  homepage "https://github.com/Next-Edit/App/"

  depends_on macos: ">= :monterey"
  

  app "Next Edit.app", target: "App Fair/Next Edit.app"
  binary "#{appdir}/App Fair/Next Edit.app/Contents/MacOS/Next Edit", target: "next-edit"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Next Edit.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Next-Edit,
    ~/Library/Application Support/app.Next-Edit,
    ~/Library/Caches/app.Next-Edit,
    ~/Library/Containers/app.Next-Edit,
    ~/Library/HTTPStorages/app.Next-Edit,
    ~/Library/HTTPStorages/app.Next-Edit.binarycookies,
    ~/Library/Preferences/app.Next-Edit.plist,
    ~/Library/Saved Application State/app.Next-Edit.savedState
  ]
end