cask "next-edit" do
  name "Next Edit"
  version "0.0.73"
  sha256 "0dc9f549c18cb2d59da639d75c03c7af51afae9e43c00d72f8e00fc81e331491"
  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip"
  desc "Next Edit"
  homepage "https://github.com/Next-Edit/App/"
  app "Next Edit.app", target: "App Fair/Next Edit.app"
  depends_on macos: ">= :monterey"
  
  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Next Edit.app"
  end
end