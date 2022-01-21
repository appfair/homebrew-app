cask "trivial-quiz" do
  version "0.0.9"
  sha256 "0a63589733e9d5b5cdcd60c85365da40808caabc1648f7983fa59e5109b0aacd"

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