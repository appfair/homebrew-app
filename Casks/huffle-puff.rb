cask "huffle-puff" do
  version "0.0.5"
  sha256 "cf5bb81bc15df2cf5a5e1d605dad6c544267b05892ad4f0463579408d664436f"

  url "https://github.com/Huffle-Puff/App/releases/download/#{version}/Huffle-Puff-macOS.zip",
      verified: "github.com/Huffle-Puff/"
  name "Huffle Puff"
  desc "H.R. Huffle Puff "
  homepage "https://github.com/Huffle-Puff/App/"

  depends_on macos: ">= :monterey"
  

  app "Huffle Puff.app", target: "App Fair/Huffle Puff.app"
  binary "#{appdir}/App Fair/Huffle Puff.app/Contents/MacOS/Huffle Puff", target: "huffle-puff"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Huffle Puff.app"
  end

  zap trash: [
    "~/Library/Caches/app.Huffle-Puff",
    "~/Library/Containers/app.Huffle-Puff",
    "~/Library/Preferences/app.Huffle-Puff.plist",
    "~/Library/Application Scripts/app.Huffle-Puff",
    "~/Library/Saved Application State/app.Huffle-Puff.savedState",
  ]
end