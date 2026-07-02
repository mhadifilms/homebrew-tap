class Autoneat < Formula
  include Language::Python::Virtualenv

  desc "Standalone Neat Video Auto Profile automation for DaVinci Resolve"
  homepage "https://github.com/mhadifilms/autoneat"
  url "https://github.com/mhadifilms/autoneat/archive/refs/tags/v0.4.7.tar.gz"
  sha256 "22249cef92e41d78deaf59823fa5c8baff90b4946f1544e2a2abd880dbe12216"
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # Dependencies (numpy, opencv, pyobjc, dvr) install as wheels from PyPI;
    # building them from source in a formula is impractical.
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath.to_s
    bin.install_symlink libexec/"bin/autoneat"
  end

  test do
    system bin/"autoneat", "--help"
  end
end
