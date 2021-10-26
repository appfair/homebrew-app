cask 'bon-mot' do
  version '0.0.24'
  sha256 '6109ecc33d4367fe8353634bc67645e2a1559f7a6a1255e08516b8ddb277803e'

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