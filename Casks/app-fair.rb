cask 'app-fair' do
  version '0.6.120'
  sha256 '6b4cd1f866c7b0f9bdeba55756976249326d59648879c5206dfece4cf7bbbaf6'

  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip",
      verified: "github.com/App-Fair/"
  name 'App Fair'
  desc 'App Fair'
  homepage 'https://github.com/App-Fair/App/'

  depends_on macos: '>= :monterey'
  depends_on cask: "app-fair"

  app 'App Fair.app', target: 'App Fair.app'

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair.app"
  end

  uninstall quit: 'app.App-Fair'
  zap trash: '~/Library/Containers/app.App-Fair'
end