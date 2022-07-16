cask "huffle-puff-prerelease" do
  version "0.0.7"
  sha256 "de70cbd5d9af1cd40a5a4fe6cb761f3f8186ff97adc6c94be14325d7784fb23b"

  url "https://github.com/Huffle-Puff/App/releases/download/#{version}/Huffle-Puff-macOS.zip",
      verified: "github.com/Huffle-Puff/"
  name "Huffle Puff"
  desc "H.R. Huffle Puff "
  homepage "https://github.com/Huffle-Puff/App/"

  depends_on macos: ">= :monterey"
  

  app "Huffle Puff.app", target: "App Fair/Huffle Puff.app"
  binary "#{appdir}/App Fair/Huffle Puff.app/Contents/MacOS/Huffle Puff", target: "huffle-puff-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Huffle Puff.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Huffle-Puff,
    ~/Library/Application Support/app.Huffle-Puff,
    ~/Library/Caches/app.Huffle-Puff,
    ~/Library/Containers/app.Huffle-Puff,
    ~/Library/HTTPStorages/app.Huffle-Puff,
    ~/Library/HTTPStorages/app.Huffle-Puff.binarycookies,
    ~/Library/Preferences/app.Huffle-Puff.plist,
    ~/Library/Saved Application State/app.Huffle-Puff.savedState
  ]
end