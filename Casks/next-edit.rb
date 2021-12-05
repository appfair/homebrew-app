cask "next-edit" do
  version "0.4.5"
  sha256 "461ed5f3112232ca935d0bcb6a1d2423f4b53b677f1959a2b6abec6dca90ba22"

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
    "~/Library/Caches/app.Next-Edit",
    "~/Library/Containers/app.Next-Edit",
    "~/Library/Preferences/app.Next-Edit.plist",
    "~/Library/Application Scripts/app.Next-Edit",
    "~/Library/Saved Application State/app.Next-Edit.savedState",
  ]
end