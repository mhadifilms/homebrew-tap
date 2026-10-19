class Flock < Formula
  desc "Agent-first file transfer over QUIC/UDP with JSON events"
  homepage "https://github.com/mhadifilms/flock"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_darwin_arm64.tar.gz"
      sha256 "528e79d3472cfcfacba82b65291f706d2af49872fe921549875714ba802e6ab5"
    end
    on_intel do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_darwin_amd64.tar.gz"
      sha256 "39d3576ee96fa25af949f916eba900a2908053e8c912a1357025cb141e7c8774"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_linux_arm64.tar.gz"
      sha256 "969c83b649d6d62c00204438bf09828d0803060f7489f008edce809eeab92ad3"
    end
    on_intel do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_linux_amd64.tar.gz"
      sha256 "4665d0b94f10d2c78e8f1bc5494a41fb77a006559af3367436de52a245f2e23c"
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
