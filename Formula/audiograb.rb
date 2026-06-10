class Audiograb < Formula
  desc "Local macOS per-app audio capture CLI"
  homepage "https://github.com/mhadifilms/audiograb"
  url "https://github.com/mhadifilms/audiograb/releases/download/v0.1.0/audiograb-0.1.0-macos-arm64.tar.gz"
  sha256 "b45489e74bd2de5769d855bf44fbf9ea3c0737c47d2ece080176ae1c427dc282"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "audiograb"
  end

  test do
    assert_match "audiograb 0.1.0", shell_output("#{bin}/audiograb --version")
  end
end
