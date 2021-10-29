cask "tango-cop" do
  version "0.0.1"
  sha256 "f90cf3c26a9150342c87ca926475bfe74f425752602caab90918c9afe7cd98a8"

  url "https://github.com/Tango-Cop/App/releases/download/#{version}/Tango-Cop-macOS.zip",
      verified: "github.com/Tango-Cop/"
  name "Tango Cop"
  desc "A cute little app I just made"
  homepage "https://github.com/Tango-Cop/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Tango Cop.app", target: "App Fair/Tango Cop.app"
  

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Tango Cop.app"
  end

  uninstall quit: "app.Tango-Cop"
  zap trash: [
    "~/Library/Caches/app.Tango-Cop",
    "~/Library/Containers/app.Tango-Cop",
    "~/Library/Preferences/app.Tango-Cop.plist",
    "~/Library/Application Scripts/app.Tango-Cop",
    "~/Library/Saved Application State/app.Tango-Cop.savedState",
  ]
end