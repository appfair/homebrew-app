cask "lex-stanza" do
  version "0.0.8"
  sha256 "fe3564c7a84daadcd50103bad400fe1a6117c621bbd6fb71393852a896f15aeb"

  url "https://github.com/Lex-Stanza/App/releases/download/#{version}/Lex-Stanza-macOS.zip",
      verified: "github.com/Lex-Stanza/"
  name "Lex Stanza"
  desc "Fork to make an App Fair App"
  homepage "https://github.com/Lex-Stanza/App/"

  depends_on macos: ">= :monterey"
  

  app "Lex Stanza.app", target: "App Fair/Lex Stanza.app"
  binary "#{appdir}/App Fair/Lex Stanza.app/Contents/MacOS/Lex Stanza", target: "lex-stanza"

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