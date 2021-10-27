cask "next-edit" do
  version "0.0.81"
  sha256 "907777bce7301910119fc7c7e3b0869a96835df31240a5c3e48b8f846648c4a9"

  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip",
      verified: "github.com/Next-Edit/"
  name "Next Edit"
  desc "Syntactic Text Editor"
  homepage "https://github.com/Next-Edit/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Next Edit.app", target: "App Fair/Next Edit.app"

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