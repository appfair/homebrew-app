cask "shore-postmaster" do
  version "0.0.1"
  sha256 "626e61f423c905ff5ad5d58fcfe5ecab7eacd25a45e3b24e095543bb803c3236"

  url "https://github.com/Shore-Postmaster/App/releases/download/#{version}/Shore-Postmaster-macOS.zip",
      verified: "github.com/Shore-Postmaster/"
  name "Shore Postmaster"
  desc "Always demo apps"
  homepage "https://github.com/Shore-Postmaster/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Shore Postmaster.app", target: "App Fair/Shore Postmaster.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Shore Postmaster.app"
  end

  uninstall quit: "app.Shore-Postmaster"
  zap trash: [
    "~/Library/Caches/app.Shore-Postmaster",
    "~/Library/Containers/app.Shore-Postmaster",
    "~/Library/Preferences/app.Shore-Postmaster.plist",
    "~/Library/Application Scripts/app.Shore-Postmaster",
    "~/Library/Saved Application State/app.Shore-Postmaster.savedState",
  ]
end