cask "visi-calc" do
  version "0.0.36"
  sha256 "9aa20ae375ca919239e805abef6ef59258d0809cde71dde0a05b569d90cd769f"

  url "https://github.com/Visi-Calc/App/releases/download/#{version}/Visi-Calc-macOS.zip",
      verified: "github.com/Visi-Calc/"
  name "Visi Calc"
  desc "A business app for business-folk"
  homepage "https://github.com/Visi-Calc/App/"

  depends_on macos: ">= :monterey"
  

  app "Visi Calc.app", target: "App Fair/Visi Calc.app"
  binary "#{appdir}/App Fair/Visi Calc.app/Contents/MacOS/Visi Calc", target: "visi-calc"

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