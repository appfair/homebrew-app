cask "blunder-busq" do
  version "0.0.20"
  sha256 "6d8935fd52d9e2609f7128c726a3a3e6302849786f352ad05ac153f7a1422bdf"

  url "https://github.com/Blunder-Busq/App/releases/download/#{version}/Blunder-Busq-macOS.zip",
      verified: "github.com/Blunder-Busq/"
  name "Blunder Busq"
  desc "App for managing iOS devices"
  homepage "https://github.com/Blunder-Busq/App/"

  depends_on macos: ">= :monterey"
  

  app "Blunder Busq.app", target: "App Fair/Blunder Busq.app"
  binary "#{appdir}/App Fair/Blunder Busq.app/Contents/MacOS/Blunder Busq", target: "blunder-busq"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Blunder Busq.app"
  end

  zap trash: [
    "~/Library/Caches/app.Blunder-Busq",
    "~/Library/Containers/app.Blunder-Busq",
    "~/Library/Preferences/app.Blunder-Busq.plist",
    "~/Library/Application Scripts/app.Blunder-Busq",
    "~/Library/Saved Application State/app.Blunder-Busq.savedState",
  ]
end