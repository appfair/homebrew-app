cask 'cloud-cuckoo' do
  version '0.8.85'
  sha256 '64306d58d04e35b740ec931bd2ba7bc58f5489f51a5aa00243fae8f71c3f9eb7'

  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip",
      verified: "github.com/Cloud-Cuckoo/"
  name 'Cloud Cuckoo'
  desc 'Cloud Cuckoo'
  homepage 'https://github.com/Cloud-Cuckoo/App/'

  depends_on macos: '>= :monterey'
  

  app 'Cloud Cuckoo.app', target: 'App Fair/Cloud Cuckoo.app'

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Cloud Cuckoo.app"
  end

  uninstall quit: 'app.Cloud-Cuckoo'
  zap trash: '~/Library/Containers/app.Cloud-Cuckoo'
end