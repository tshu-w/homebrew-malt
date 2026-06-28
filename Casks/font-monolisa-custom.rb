cask 'font-monolisa-custom' do
  version "3.000,2"
  sha256 "82002a2fd78b22e01d1948793fda9ce10a81c2c16a1dc06e38289fe606569bfd"

  name "MonoLisa Code/Text (zero, ss03, ss11)"
  homepage "https://monolisa.dev"
  url "https://www.dropbox.com/scl/fi/0fttw8hzzqc9ubrqldnad/MonoLisa-#{version.before_comma}-zero_ss03_ss11.zip?rlkey=1nhooaao52j4o9qrllilbh8or&dl=1",
      verified: "dropbox.com/"

  font "ttf/MonoLisaCodeItalic.ttf"
  font "ttf/MonoLisaCodeUpright.ttf"
  font "ttf/MonoLisaTextItalic.ttf"
  font "ttf/MonoLisaTextUpright.ttf"
end
