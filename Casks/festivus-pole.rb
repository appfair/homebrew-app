cask "festivus-pole" do
  version "0.0.3"
  sha256 "4c85036bb30f16b52bb03b4781cd6c8c299a548ed568ee25eac226ef95829c4c"

  url "https://github.com/Festivus-Pole/App/releases/download/#{version}/Festivus-Pole-macOS.zip",
      verified: "github.com/Festivus-Pole/"
  name "Festivus Pole"
  desc "A true Festivus celebration"
  homepage "https://github.com/Festivus-Pole/App/"

  depends_on macos: ">= :monterey"
  

  app "Festivus Pole.app", target: "App Fair/Festivus Pole.app"
  binary "#{appdir}/App Fair/Festivus Pole.app/Contents/MacOS/Festivus Pole", target: "festivus-pole"

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