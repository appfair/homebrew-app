cask "next-edit" do
  version "0.0.162"
  sha256 "83dc743b0a641bc40e37264ab36bb818d3e0277ec364714b16ba37b9c6ab4ddb"

  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip",
      verified: "github.com/Next-Edit/"
  name "Next Edit"
  desc "Syntactic Text Editor"
  homepage "https://github.com/Next-Edit/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Next Edit.app", target: "App Fair/Next Edit.app"
  binary "#{appdir}/App Fair/Next Edit.app/Contents/MacOS/Next Edit", target: "next-edit"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Next Edit.app"
  end

  uninstall quit: "app.Next-Edit"
  zap trash: [
    "~/Library/Caches/app.Next-Edit",
    "~/Library/Containers/app.Next-Edit",
    "~/Library/Preferences/app.Next-Edit.plist",
    "~/Library/Application Scripts/app.Next-Edit",
    "~/Library/Saved Application State/app.Next-Edit.savedState",
  ]
end