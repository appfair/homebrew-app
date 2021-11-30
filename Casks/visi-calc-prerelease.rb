cask "visi-calc-prerelease" do
  version "0.0.29"
  sha256 "0dd775696b6f32c5c3cf5aa3f2d2b7ae5488a5139f0daed837ba1410219fda0f"

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