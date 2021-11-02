cask "numeral-xixxxi" do
  version "0.0.1"
  sha256 "8be6d5790d640b7a9c6f4d5c0e7cca8f006908295423c94960ce051ea676591e"

  url "https://github.com/Numeral-XIXXXI/App/releases/download/#{version}/Numeral-XIXXXI-macOS.zip",
      verified: "github.com/Numeral-XIXXXI/"
  name "Numeral XIXXXI"
  desc "This is a simple but useful app"
  homepage "https://github.com/Numeral-XIXXXI/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XIXXXI.app", target: "App Fair/Numeral XIXXXI.app"
  binary "#{appdir}/App Fair/Numeral XIXXXI.app/Contents/MacOS/Numeral XIXXXI", target: "numeral-xixxxi"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XIXXXI.app"
  end

  uninstall quit: "app.Numeral-XIXXXI"
  zap trash: [
    "~/Library/Caches/app.Numeral-XIXXXI",
    "~/Library/Containers/app.Numeral-XIXXXI",
    "~/Library/Preferences/app.Numeral-XIXXXI.plist",
    "~/Library/Application Scripts/app.Numeral-XIXXXI",
    "~/Library/Saved Application State/app.Numeral-XIXXXI.savedState",
  ]
end