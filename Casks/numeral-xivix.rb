cask "numeral-xivix" do
  version "0.0.1"
  sha256 "0f4192b2e6a9bd8ae197497c27e496df5fa0a9c1ad3dad3003087371d4c88baa"

  url "https://github.com/Numeral-XIVIX/App/releases/download/#{version}/Numeral-XIVIX-macOS.zip",
      verified: "github.com/Numeral-XIVIX/"
  name "Numeral XIVIX"
  desc "A simple but useful app"
  homepage "https://github.com/Numeral-XIVIX/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XIVIX.app", target: "App Fair/Numeral XIVIX.app"
  binary "#{appdir}/App Fair/Numeral XIVIX.app/Contents/MacOS/Numeral XIVIX", target: "numeral-xivix"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XIVIX.app"
  end

  uninstall quit: "app.Numeral-XIVIX"
  zap trash: [
    "~/Library/Caches/app.Numeral-XIVIX",
    "~/Library/Containers/app.Numeral-XIVIX",
    "~/Library/Preferences/app.Numeral-XIVIX.plist",
    "~/Library/Application Scripts/app.Numeral-XIVIX",
    "~/Library/Saved Application State/app.Numeral-XIVIX.savedState",
  ]
end