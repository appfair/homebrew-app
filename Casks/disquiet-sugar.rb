cask "disquiet-sugar" do
  version "0.0.1"
  sha256 "3bfd5b09adac5ab827273d8f5e0065549777465599ad5458e69ed4a90b6dbe75"

  url "https://github.com/Disquiet-Sugar/App/releases/download/#{version}/Disquiet-Sugar-macOS.zip",
      verified: "github.com/Disquiet-Sugar/"
  name "Disquiet Sugar"
  desc "Another demo app"
  homepage "https://github.com/Disquiet-Sugar/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Disquiet Sugar.app", target: "App Fair/Disquiet Sugar.app"
  

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Disquiet Sugar.app"
  end

  uninstall quit: "app.Disquiet-Sugar"
  zap trash: [
    "~/Library/Caches/app.Disquiet-Sugar",
    "~/Library/Containers/app.Disquiet-Sugar",
    "~/Library/Preferences/app.Disquiet-Sugar.plist",
    "~/Library/Application Scripts/app.Disquiet-Sugar",
    "~/Library/Saved Application State/app.Disquiet-Sugar.savedState",
  ]
end