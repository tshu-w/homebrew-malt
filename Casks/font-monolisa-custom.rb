cask 'font-monolisa-custom' do
  version "3.000,1"
  sha256 "59976147f0000978bd057a45c18ff4ccf0c93a7480b28d9b13b611ed59feef2b"

  name "MonoLisa Code/Text Custom (zero, ss03, ss11)"
  homepage "https://monolisa.dev"
  url "https://www.dropbox.com/scl/fi/0fttw8hzzqc9ubrqldnad/MonoLisa-#{version.before_comma}-zero_ss03_ss07.zip?rlkey=1nhooaao52j4o9qrllilbh8or&dl=1",
      verified: "dropbox.com/"

  font "ttf/MonoLisaCodeCustomItalic.ttf"
  font "ttf/MonoLisaCodeCustomUpright.ttf"
  font "ttf/MonoLisaTextCustomItalic.ttf"
  font "ttf/MonoLisaTextCustomUpright.ttf"
end
