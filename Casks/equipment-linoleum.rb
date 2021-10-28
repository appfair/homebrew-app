cask "equipment-linoleum" do
  version "0.0.1"
  sha256 "392d34edd0203d07afb3f82ae9ed9e5d7dca06342f1686ed5fe832da50ecc231"

  url "https://github.com/Equipment-Linoleum/App/releases/download/#{version}/Equipment-Linoleum-macOS.zip",
      verified: "github.com/Equipment-Linoleum/"
  name "Equipment Linoleum"
  desc "Another simple demo app"
  homepage "https://github.com/Equipment-Linoleum/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Equipment Linoleum.app", target: "App Fair/Equipment Linoleum.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Equipment Linoleum.app"
  end

  uninstall quit: "app.Equipment-Linoleum"
  zap trash: [
    "~/Library/Caches/app.Equipment-Linoleum",
    "~/Library/Containers/app.Equipment-Linoleum",
    "~/Library/Preferences/app.Equipment-Linoleum.plist",
    "~/Library/Application Scripts/app.Equipment-Linoleum",
    "~/Library/Saved Application State/app.Equipment-Linoleum.savedState",
  ]
end