cask "micro-vector-prerelease" do
  version "0.0.8"
  sha256 "62d9c7a67c652dd3504c0574780869dcba80b5cae7617cb05790e0028d5fc482"

  url "https://github.com/Micro-Vector/App/releases/download/#{version}/Micro-Vector-macOS.zip",
      verified: "github.com/Micro-Vector/"
  name "Micro Vector"
  desc "A vector drawing app"
  homepage "https://github.com/Micro-Vector/App/"

  depends_on macos: ">= :monterey"
  

  app "Micro Vector.app", target: "App Fair/Micro Vector.app"
  binary "#{appdir}/App Fair/Micro Vector.app/Contents/MacOS/Micro Vector", target: "micro-vector-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Micro Vector.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Micro-Vector,
    ~/Library/Application Support/app.Micro-Vector,
    ~/Library/Caches/app.Micro-Vector,
    ~/Library/Containers/app.Micro-Vector,
    ~/Library/HTTPStorages/app.Micro-Vector,
    ~/Library/HTTPStorages/app.Micro-Vector.binarycookies,
    ~/Library/Preferences/app.Micro-Vector.plist,
    ~/Library/Saved Application State/app.Micro-Vector.savedState
  ]
end