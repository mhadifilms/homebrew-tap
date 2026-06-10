class Audiograb < Formula
  desc "Local macOS per-app audio capture CLI"
  homepage "https://github.com/mhadifilms/audiograb"
  url "https://github.com/mhadifilms/audiograb/releases/download/v0.1.0/audiograb-0.1.0-macos-arm64.tar.gz"
  sha256 "182062e83e6b267fc3b4091a6871cfa240abdb631a7dc5e07bebe395f0e62136"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "audiograb"
  end

  test do
    assert_match "audiograb 0.1.0", shell_output("#{bin}/audiograb --version")
  end
end
