cask 'font-monolisa' do
  version "3.000"
  sha256 "cff783ab88ac74f40e8a11ff0be14354969c946fc29b54237a906a6e02233dc4"

  name "MonoLisa Code/Text"
  homepage "https://monolisa.dev"
  url "https://www.dropbox.com/scl/fi/5bwplr5deofzbmglr03oj/MonoLisa-#{version}.zip?rlkey=ef0w72pqdytack35a8jubxgdi&dl=1",
      verified: "dropbox.com/"

  font "ttf/MonoLisaCodeItalic.ttf"
  font "ttf/MonoLisaCodeUpright.ttf"
  font "ttf/MonoLisaTextItalic.ttf"
  font "ttf/MonoLisaTextUpright.ttf"
end
