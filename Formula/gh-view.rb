class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.3/gh-view-v0.0.3-aarch64-apple-darwin.tar.gz"
    sha256 "e84e8f427487c0510ee0d334dbe46c6a4ce8f8db28c848bfe48527df55fb7a5f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.3/gh-view-v0.0.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a2213f6aeaea532f90c0258023f27cd35d2ccfa1ec300acc282f0d409e1e3844"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
