cask "main-course" do
  version "0.0.15"
  sha256 "61d9aafa6bbde8fc57effa4a9bc46823453042a33d5ffccf2ee49da7cc32574f"

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