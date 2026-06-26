cask 'font-monolisa-custom' do
  version "3.000"
  sha256 "572279ea6dcd75bd08cdae9b5c156b6290e7907c4204c5d2b678ec71b2f3021a"

  name "MonoLisa Code/Text Custom (zero, ss03, ss07)"
  homepage "https://monolisa.dev"
  url "https://www.dropbox.com/scl/fi/0fttw8hzzqc9ubrqldnad/MonoLisa-#{version}-zero_ss03_ss07.zip?rlkey=1nhooaao52j4o9qrllilbh8or&dl=1",
      verified: "dropbox.com/"

  font "ttf/MonoLisaCodeCustomItalic.ttf"
  font "ttf/MonoLisaCodeCustomUpright.ttf"
  font "ttf/MonoLisaTextCustomItalic.ttf"
  font "ttf/MonoLisaTextCustomUpright.ttf"
end
