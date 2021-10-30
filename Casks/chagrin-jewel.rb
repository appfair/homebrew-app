cask "chagrin-jewel" do
  version "0.0.1"
  sha256 "74bc7dc9636473f4a1b7e6f4baa05450183a19bed5100e13c751b80f84803efb"

  url "https://github.com/Chagrin-Jewel/App/releases/download/#{version}/Chagrin-Jewel-macOS.zip",
      verified: "github.com/Chagrin-Jewel/"
  name "Chagrin Jewel"
  desc "A final demo application"
  homepage "https://github.com/Chagrin-Jewel/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Chagrin Jewel.app", target: "App Fair/Chagrin Jewel.app"
  

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Chagrin Jewel.app"
  end

  uninstall quit: "app.Chagrin-Jewel"
  zap trash: [
    "~/Library/Caches/app.Chagrin-Jewel",
    "~/Library/Containers/app.Chagrin-Jewel",
    "~/Library/Preferences/app.Chagrin-Jewel.plist",
    "~/Library/Application Scripts/app.Chagrin-Jewel",
    "~/Library/Saved Application State/app.Chagrin-Jewel.savedState",
  ]
end