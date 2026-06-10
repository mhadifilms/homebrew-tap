cask "audiograb" do
  version "0.1.0"
  sha256 "db89784d9628acdc6dad3bf77d37cc771340d49108a7f71769feef283b1e9fa9"

  url "https://github.com/mhadifilms/audiograb/releases/download/v#{version}/AudioGrab-#{version}-macos-arm64.app.zip"
  name "AudioGrab"
  desc "Local macOS per-app audio capture menu bar app"
  homepage "https://github.com/mhadifilms/audiograb"

  depends_on macos: ">= :sonoma"

  app "AudioGrab.app"

  zap trash: "~/.audiograb"
end
