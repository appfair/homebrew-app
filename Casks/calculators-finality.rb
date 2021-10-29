cask "calculators-finality" do
  version "0.0.1"
  sha256 "f8744dc95a1d4f5e767e2473f270fbc2b2af900e0683df61407911a636dbfa49"

  url "https://github.com/Calculators-Finality/App/releases/download/#{version}/Calculators-Finality-macOS.zip",
      verified: "github.com/Calculators-Finality/"
  name "Calculators Finality"
  desc "An app that does stuff"
  homepage "https://github.com/Calculators-Finality/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Calculators Finality.app", target: "App Fair/Calculators Finality.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Calculators Finality.app"
  end

  uninstall quit: "app.Calculators-Finality"
  zap trash: [
    "~/Library/Caches/app.Calculators-Finality",
    "~/Library/Containers/app.Calculators-Finality",
    "~/Library/Preferences/app.Calculators-Finality.plist",
    "~/Library/Application Scripts/app.Calculators-Finality",
    "~/Library/Saved Application State/app.Calculators-Finality.savedState",
  ]
end