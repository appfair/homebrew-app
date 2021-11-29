cask "visi-calc-prerelease" do
  version "0.0.15"
  sha256 "65c03b59e438f536dea62e4e50727a704a3aeefd1ef61364db90cb71731a7e6a"

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
    "~/Library/Caches/app.Visi-Calc",
    "~/Library/Containers/app.Visi-Calc",
    "~/Library/Preferences/app.Visi-Calc.plist",
    "~/Library/Application Scripts/app.Visi-Calc",
    "~/Library/Saved Application State/app.Visi-Calc.savedState",
  ]
end