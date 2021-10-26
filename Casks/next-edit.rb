cask 'next-edit' do
  version '0.0.73'
  sha256 '0dc9f549c18cb2d59da639d75c03c7af51afae9e43c00d72f8e00fc81e331491'

  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip",
      verified: "github.com/Next-Edit/"
  name 'Next Edit'
  desc 'Next Edit'
  homepage 'https://github.com/Next-Edit/App/'

  depends_on macos: '>= :monterey'
  

  app 'Next Edit.app', target: 'App Fair/Next Edit.app'

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Next Edit.app"
  end

  uninstall quit: 'app.Next-Edit'
  zap trash: '~/Library/Containers/app.Next-Edit'
end