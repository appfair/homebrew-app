cask "next-edit" do
  version "0.1.5"
  sha256 "a7da11f1cd3ca51fc42c4e42d23999e8cc3fea17fb6b55d15826ff8d28b11df9"

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

  zap trash: [
    "~/Library/Caches/app.Next-Edit",
    "~/Library/Containers/app.Next-Edit",
    "~/Library/Preferences/app.Next-Edit.plist",
    "~/Library/Application Scripts/app.Next-Edit",
    "~/Library/Saved Application State/app.Next-Edit.savedState",
  ]
end