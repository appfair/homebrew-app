cask "bon-mot" do
  name "Bon Mot"
  version "0.0.23"
  sha256 "bf56839832f81cd1be47ac7f51ce7f90ead21d712f16d6f7b01e76597f80e29f"
  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip"
  desc "Bon Mot"
  homepage "https://github.com/Bon-Mot/App/"
  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  depends_on macos: ">= :monterey"
  
  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Bon Mot.app"
  end
end