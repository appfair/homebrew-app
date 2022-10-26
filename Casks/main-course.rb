cask "main-course" do
  version "0.0.16"
  sha256 "926fde94d13f0a780767f29d4fce37592d73c03cf2b5b58fc4b9ae9c66e127aa"

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
    "~/Library/Application Scripts/app.Main-Course",
    "~/Library/Application Support/app.Main-Course",
    "~/Library/Caches/app.Main-Course",
    "~/Library/Containers/app.Main-Course",
    "~/Library/HTTPStorages/app.Main-Course",
    "~/Library/HTTPStorages/app.Main-Course.binarycookies",
    "~/Library/Preferences/app.Main-Course.plist",
    "~/Library/Saved Application State/app.Main-Course.savedState"
  ]
end