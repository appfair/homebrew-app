cask "mathematics-delegation" do
  version "0.0.1"
  sha256 "1b541b25b3b4657eca52f5e981da87e99bc97fab7951c667fdd4a5eaeb0900a1"

  url "https://github.com/Mathematics-Delegation/App/releases/download/#{version}/Mathematics-Delegation-macOS.zip",
      verified: "github.com/Mathematics-Delegation/"
  name "Mathematics Delegation"
  desc "A math education app"
  homepage "https://github.com/Mathematics-Delegation/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Mathematics Delegation.app", target: "App Fair/Mathematics Delegation.app"
  

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Mathematics Delegation.app"
  end

  uninstall quit: "app.Mathematics-Delegation"
  zap trash: [
    "~/Library/Caches/app.Mathematics-Delegation",
    "~/Library/Containers/app.Mathematics-Delegation",
    "~/Library/Preferences/app.Mathematics-Delegation.plist",
    "~/Library/Application Scripts/app.Mathematics-Delegation",
    "~/Library/Saved Application State/app.Mathematics-Delegation.savedState",
  ]
end