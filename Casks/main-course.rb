cask "main-course" do
  version "0.0.6"
  sha256 "49820177b56cabb67f8a45881342ac5fa2c24af4909ddc5ab43ef43d7aaf5d3c"

  url "https://github.com/Main-Course/App/releases/download/#{version}/Main-Course-macOS.zip",
      verified: "github.com/Main-Course/"
  name "Main Course"
  desc "An offline recipe book"
  homepage "https://github.com/Main-Course/App/"

  depends_on macos: ">= :monterey"
  

  app "Main Course.app", target: "App Fair/Main Course.app"
  binary "#{appdir}/App Fair/Main Course.app/Contents/MacOS/Main Course", target: "main-course"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Main Course.app"
  end

  zap trash: [
    "~/Library/Caches/app.Main-Course",
    "~/Library/Containers/app.Main-Course",
    "~/Library/Preferences/app.Main-Course.plist",
    "~/Library/Application Scripts/app.Main-Course",
    "~/Library/Saved Application State/app.Main-Course.savedState",
  ]
end