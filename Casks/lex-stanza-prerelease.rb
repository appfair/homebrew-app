cask "lex-stanza-prerelease" do
  version "0.0.9"
  sha256 "f9988d007d4c56a52e049dccf2dd14faae6ba517ddf69b6d34450f9a2d9ba345"

  url "https://github.com/Lex-Stanza/App/releases/download/#{version}/Lex-Stanza-macOS.zip",
      verified: "github.com/Lex-Stanza/"
  name "Lex Stanza"
  desc "An electronic book reader"
  homepage "https://github.com/Lex-Stanza/App/"

  depends_on macos: ">= :monterey"
  

  app "Lex Stanza.app", target: "App Fair/Lex Stanza.app"
  binary "#{appdir}/App Fair/Lex Stanza.app/Contents/MacOS/Lex Stanza", target: "lex-stanza-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Lex Stanza.app"
  end

  zap trash: [
    "~/Library/Caches/app.Lex-Stanza",
    "~/Library/Containers/app.Lex-Stanza",
    "~/Library/Preferences/app.Lex-Stanza.plist",
    "~/Library/Application Scripts/app.Lex-Stanza",
    "~/Library/Saved Application State/app.Lex-Stanza.savedState",
  ]
end