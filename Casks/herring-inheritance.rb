cask "herring-inheritance" do
  version "0.0.1"
  sha256 "16fd5f00d93a3a8f70e756b2f9476a77f5732c9c1976a4b5815bf48657c2a688"

  url "https://github.com/Herring-Inheritance/App/releases/download/#{version}/Herring-Inheritance-macOS.zip",
      verified: "github.com/Herring-Inheritance/"
  name "Herring Inheritance"
  desc "A tool for stuff and nonsense "
  homepage "https://github.com/Herring-Inheritance/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Herring Inheritance.app", target: "App Fair/Herring Inheritance.app"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Herring Inheritance.app"
  end

  uninstall quit: "app.Herring-Inheritance"
  zap trash: [
    "~/Library/Caches/app.Herring-Inheritance",
    "~/Library/Containers/app.Herring-Inheritance",
    "~/Library/Preferences/app.Herring-Inheritance.plist",
    "~/Library/Application Scripts/app.Herring-Inheritance",
    "~/Library/Saved Application State/app.Herring-Inheritance.savedState",
  ]
end