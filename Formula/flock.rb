class Flock < Formula
  desc "Agent-first file transfer over QUIC/UDP with JSON events"
  homepage "https://github.com/mhadifilms/flock"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_darwin_arm64.tar.gz"
      sha256 "e9db303c2520fcf64829646fa71e9ff87a9c24c475ccc522e3884ff2ef024026"
    end
    on_intel do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_darwin_amd64.tar.gz"
      sha256 "65461fe4668695e8180dd9347b1eb82c6d4bc08fadfabeca1b4d1362c28ae497"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_linux_arm64.tar.gz"
      sha256 "1b38f8e90800658a3add515e08179bd0e5feb6efa35f4f01cb87586454a1318c"
    end
    on_intel do
      url "https://github.com/mhadifilms/flock/releases/download/v0.1.0/flock_0.1.0_linux_amd64.tar.gz"
      sha256 "5ea8dcdd5f37f531bb43b27f27dc47b13f597059f387ee6f412bf2bed9c22dd5"
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
