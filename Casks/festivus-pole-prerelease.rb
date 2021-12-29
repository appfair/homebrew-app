cask "festivus-pole-prerelease" do
  version "0.0.1"
  sha256 "7b6c55d8ddcc53c79b8d0d04240fe2aec462a14263f66bf283c0ebe7f8fe367d"

  url "https://github.com/Festivus-Pole/App/releases/download/#{version}/Festivus-Pole-macOS.zip",
      verified: "github.com/Festivus-Pole/"
  name "Festivus Pole"
  desc "A true Festivus celebration"
  homepage "https://github.com/Festivus-Pole/App/"

  depends_on macos: ">= :monterey"
  

  app "Festivus Pole.app", target: "App Fair/Festivus Pole.app"
  binary "#{appdir}/App Fair/Festivus Pole.app/Contents/MacOS/Festivus Pole", target: "festivus-pole-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Festivus Pole.app"
  end

  zap trash: [
    "~/Library/Caches/app.Festivus-Pole",
    "~/Library/Containers/app.Festivus-Pole",
    "~/Library/Preferences/app.Festivus-Pole.plist",
    "~/Library/Application Scripts/app.Festivus-Pole",
    "~/Library/Saved Application State/app.Festivus-Pole.savedState",
  ]
end