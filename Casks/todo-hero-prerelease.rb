cask "todo-hero-prerelease" do
  version "0.0.1"
  sha256 "7b5553023b35eaee644d89cb1b94997869cb7de05712953e6865f3c9e6a43ede"

  url "https://github.com/Todo-Hero/App/releases/download/#{version}/Todo-Hero-macOS.zip",
      verified: "github.com/Todo-Hero/"
  name "Todo Hero"
  desc "A simple TODO management app"
  homepage "https://github.com/Todo-Hero/App/"

  depends_on macos: ">= :monterey"
  

  app "Todo Hero.app", target: "App Fair/Todo Hero.app"
  binary "#{appdir}/App Fair/Todo Hero.app/Contents/MacOS/Todo Hero", target: "todo-hero-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Todo Hero.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Todo-Hero,
    ~/Library/Application Support/app.Todo-Hero,
    ~/Library/Caches/app.Todo-Hero,
    ~/Library/Containers/app.Todo-Hero,
    ~/Library/HTTPStorages/app.Todo-Hero,
    ~/Library/HTTPStorages/app.Todo-Hero.binarycookies,
    ~/Library/Preferences/app.Todo-Hero.plist,
    ~/Library/Saved Application State/app.Todo-Hero.savedState
  ]
end