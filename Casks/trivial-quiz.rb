cask "trivial-quiz" do
  version "0.0.11"
  sha256 "af7d0a152cc3dc72aade8fa716cfb1bdbea8fd388641573db65c6fff55209e84"

  url "https://github.com/Trivial-Quiz/App/releases/download/#{version}/Trivial-Quiz-macOS.zip",
      verified: "github.com/Trivial-Quiz/"
  name "Trivial Quiz"
  desc "A little quiz game"
  homepage "https://github.com/Trivial-Quiz/App/"

  depends_on macos: ">= :monterey"
  

  app "Trivial Quiz.app", target: "App Fair/Trivial Quiz.app"
  binary "#{appdir}/App Fair/Trivial Quiz.app/Contents/MacOS/Trivial Quiz", target: "trivial-quiz"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Trivial Quiz.app"
  end

  zap trash: [
    "~/Library/Caches/app.Trivial-Quiz",
    "~/Library/Containers/app.Trivial-Quiz",
    "~/Library/Preferences/app.Trivial-Quiz.plist",
    "~/Library/Application Scripts/app.Trivial-Quiz",
    "~/Library/Saved Application State/app.Trivial-Quiz.savedState",
  ]
end