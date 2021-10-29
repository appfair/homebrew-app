cask "paradigm-burrito" do
  version "0.0.1"
  sha256 "af72eb3a714143e6848027ab8fbfd125968a4a01f72f9d2a826b52db4d805048"

  url "https://github.com/Paradigm-Burrito/App/releases/download/#{version}/Paradigm-Burrito-macOS.zip",
      verified: "github.com/Paradigm-Burrito/"
  name "Paradigm Burrito"
  desc "A silly little demo app"
  homepage "https://github.com/Paradigm-Burrito/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Paradigm Burrito.app", target: "App Fair/Paradigm Burrito.app"
  

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Paradigm Burrito.app"
  end

  uninstall quit: "app.Paradigm-Burrito"
  zap trash: [
    "~/Library/Caches/app.Paradigm-Burrito",
    "~/Library/Containers/app.Paradigm-Burrito",
    "~/Library/Preferences/app.Paradigm-Burrito.plist",
    "~/Library/Application Scripts/app.Paradigm-Burrito",
    "~/Library/Saved Application State/app.Paradigm-Burrito.savedState",
  ]
end