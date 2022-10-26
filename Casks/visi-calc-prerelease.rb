cask "visi-calc-prerelease" do
  version "0.0.37"
  sha256 "43841499d299d2bf7aa617cd14df2026c4f7c0a95be9d6c1eefe265e6a6883ca"

  url "https://github.com/Visi-Calc/App/releases/download/#{version}/Visi-Calc-macOS.zip",
      verified: "github.com/Visi-Calc/"
  name "Visi Calc"
  desc "A business app for business-folk"
  homepage "https://github.com/Visi-Calc/App/"

  depends_on macos: ">= :monterey"
  

  app "Visi Calc.app", target: "App Fair/Visi Calc.app"
  binary "#{appdir}/App Fair/Visi Calc.app/Contents/MacOS/Visi Calc", target: "visi-calc-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Visi Calc.app"
  end

  zap trash: [
    "~/Library/Application Scripts/app.Visi-Calc",
    "~/Library/Application Support/app.Visi-Calc",
    "~/Library/Caches/app.Visi-Calc",
    "~/Library/Containers/app.Visi-Calc",
    "~/Library/HTTPStorages/app.Visi-Calc",
    "~/Library/HTTPStorages/app.Visi-Calc.binarycookies",
    "~/Library/Preferences/app.Visi-Calc.plist",
    "~/Library/Saved Application State/app.Visi-Calc.savedState"
  ]
end
