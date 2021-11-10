cask "numeral-ixmcix" do
  version "0.0.4"
  sha256 "cdbf6917dcc44c7c4911d5896c6dac45bdae805f200ee0a318047ee4ca52c434"

  url "https://github.com/Numeral-IXMCIX/App/releases/download/#{version}/Numeral-IXMCIX-macOS.zip",
      verified: "github.com/Numeral-IXMCIX/"
  name "Numeral IXMCIX"
  desc "An handy and useful artists tool"
  homepage "https://github.com/Numeral-IXMCIX/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral IXMCIX.app", target: "App Fair/Numeral IXMCIX.app"
  binary "#{appdir}/App Fair/Numeral IXMCIX.app/Contents/MacOS/Numeral IXMCIX", target: "numeral-ixmcix"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral IXMCIX.app"
  end

  uninstall quit: "app.Numeral-IXMCIX"
  zap trash: [
    "~/Library/Caches/app.Numeral-IXMCIX",
    "~/Library/Containers/app.Numeral-IXMCIX",
    "~/Library/Preferences/app.Numeral-IXMCIX.plist",
    "~/Library/Application Scripts/app.Numeral-IXMCIX",
    "~/Library/Saved Application State/app.Numeral-IXMCIX.savedState",
  ]
end