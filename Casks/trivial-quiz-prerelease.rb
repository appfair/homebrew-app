cask "trivial-quiz-prerelease" do
  version "0.0.14"
  sha256 "62c8c4a599c98f9d1e7c65fe351b39c36e334ce96bf6487f3724fb53e3d55b31"

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