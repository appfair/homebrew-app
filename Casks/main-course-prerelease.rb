cask "main-course-prerelease" do
  version "0.0.8"
  sha256 "652c40aa2f5bebd55d6ea1a7a5ab9f7ddc84d582b982b3fccf22b8e09b488e11"

  url "https://github.com/Main-Course/App/releases/download/#{version}/Main-Course-macOS.zip",
      verified: "github.com/Main-Course/"
  name "Main Course"
  desc "An offline recipe book"
  homepage "https://github.com/Main-Course/App/"

  depends_on macos: ">= :monterey"
  

  app "Main Course.app", target: "App Fair/Main Course.app"
  binary "#{appdir}/App Fair/Main Course.app/Contents/MacOS/Main Course", target: "main-course-prerelease"

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