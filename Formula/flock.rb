class Flock < Formula
  desc "Agent-first file transfer over QUIC/UDP with JSON events"
  homepage "https://github.com/mhadifilms/flock"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_darwin_arm64.tar.gz"
      sha256 "9df4e65f49ba0c6e5ee98ccd28fa063b8be551a7e5c38f3c058a67d3e5cd811d"
    end
    on_intel do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_darwin_amd64.tar.gz"
      sha256 "4711fbc501dc2871fcb863d58616a2c539f36c2a2f27445c15c421c49d55241a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_linux_arm64.tar.gz"
      sha256 "864d1b3cb5d608882e74a53a13828046319f50e59d978f207ccfba2e3d684847"
    end
    on_intel do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_linux_amd64.tar.gz"
      sha256 "9abab94ac445f691efacf76417949c583a3ca5aedce15fe4459313de6d71b96d"
    end
  end

  def install
    bin.install "flock"
    doc.install "README.md", "UPSTREAM.md", "LICENSE", "THIRD_PARTY_LICENSES.txt", "wordlists-LICENSE.txt"
  end

  test do
    require "json"

    result = JSON.parse(shell_output("#{bin}/flock --version"))
    assert_equal "flock", result.fetch("name")
    assert_equal version.to_s, result.fetch("release")

    schema = JSON.parse(shell_output("#{bin}/flock schema"))
    assert_equal "quic/udp", schema.fetch("transport")

    result = JSON.parse(shell_output("#{bin}/flock receive --out received </dev/null", 1))
    assert_equal "error", result.fetch("event")
    refute_path_exists testpath/"received"
  end
end
