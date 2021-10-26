cask 'bon-mot' do
  version '0.0.25'
  sha256 '0e2a699f5aa77f124aec96055179da5cfda905ebe63e291e49081c63024a677a'

  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip",
      verified: "github.com/Bon-Mot/"
  name 'Bon Mot'
  desc 'Bon Mot'
  homepage 'https://github.com/Bon-Mot/App/'

  depends_on macos: '>= :monterey'
  

  app 'Bon Mot.app', target: 'App Fair/Bon Mot.app'

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Bon Mot.app"
  end

  uninstall quit: 'app.Bon-Mot'
  zap trash: '~/Library/Containers/app.Bon-Mot'
end