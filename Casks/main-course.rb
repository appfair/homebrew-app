cask "main-course" do
  version "0.0.3"
  sha256 "2d624138b1233e059d9bec2f1cc55d12645349a751ba1ec2d409baa02203f2b0"

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