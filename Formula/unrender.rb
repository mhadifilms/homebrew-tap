class Unrender < Formula
  include Language::Python::Virtualenv

  desc "Reconstruct editor-friendly timelines from flattened final renders"
  homepage "https://github.com/mhadifilms/unrender"
  url "https://github.com/mhadifilms/unrender/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "9fba7422b0f6a3e060690bf7ecae6c6c0f1310d80403e1669f38545349cffc2d"
  license "Apache-2.0"

  depends_on "ffmpeg"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # Core dependencies (numpy, opencv, scikit-learn, ...) install as wheels
    # from PyPI; building them from source in a formula is impractical.
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath.to_s
    bin.install_symlink libexec/"bin/unrender"
  end

  def caveats
    <<~EOS
      Optional pipeline stages need extras installed into the same environment:
        #{libexec}/bin/pip install 'unrender[face,voice,transcription,timeline]'

      Cloud source separation requires AUDIOSHAKE_API_KEY in your environment.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unrender --version")
  end
end
