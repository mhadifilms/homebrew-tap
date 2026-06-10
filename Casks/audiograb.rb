cask "audiograb" do
  version "0.1.0"
  sha256 "45ff09be85644ef9e7504c5ece14ada7b565a954a2cd150f833d8d33fde7c412"

  url "https://github.com/mhadifilms/audiograb/releases/download/v#{version}/AudioGrab-#{version}-macos-arm64.app.zip"
  name "AudioGrab"
  desc "Local macOS per-app audio capture menu bar app"
  homepage "https://github.com/mhadifilms/audiograb"

  depends_on macos: ">= :sonoma"

  app "AudioGrab.app"

  zap trash: "~/.audiograb"
end
