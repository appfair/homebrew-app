cask "trivial-quiz-prerelease" do
  version "0.0.2"
  sha256 "3810fe9290a089343baecbeda2453f3a054cceec58fc1e65bc8996407a6c23b2"

  url "https://github.com/Trivial-Quiz/App/releases/download/#{version}/Trivial-Quiz-macOS.zip",
      verified: "github.com/Trivial-Quiz/"
  name "Trivial Quiz"
  desc "A little quiz game"
  homepage "https://github.com/Trivial-Quiz/App/"

  depends_on macos: ">= :monterey"
  

  app "Trivial Quiz.app", target: "App Fair/Trivial Quiz.app"
  binary "#{appdir}/App Fair/Trivial Quiz.app/Contents/MacOS/Trivial Quiz", target: "trivial-quiz-prerelease"

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