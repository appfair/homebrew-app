cask "numeral-ixmcix-prerelease" do
  version "0.0.9"
  sha256 "fbb0c769f4222e027ca41442fdd359948a0369219fcbe32d7f8ea3ebf731679a"

  url "https://github.com/Numeral-IXMCIX/App/releases/download/#{version}/Numeral-IXMCIX-macOS.zip",
      verified: "github.com/Numeral-IXMCIX/"
  name "Numeral IXMCIX"
  desc "A handy and useful artists tool"
  homepage "https://github.com/Numeral-IXMCIX/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral IXMCIX.app", target: "App Fair/Numeral IXMCIX.app"
  binary "#{appdir}/App Fair/Numeral IXMCIX.app/Contents/MacOS/Numeral IXMCIX", target: "numeral-ixmcix-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral IXMCIX.app"
  end

  zap trash: [
    "~/Library/Caches/app.Numeral-IXMCIX",
    "~/Library/Containers/app.Numeral-IXMCIX",
    "~/Library/Preferences/app.Numeral-IXMCIX.plist",
    "~/Library/Application Scripts/app.Numeral-IXMCIX",
    "~/Library/Saved Application State/app.Numeral-IXMCIX.savedState",
  ]
end