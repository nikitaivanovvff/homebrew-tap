class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.2/gh-view-v0.0.2-aarch64-apple-darwin.tar.gz"
    sha256 "2cbce686374d1d3e1b8ce5c846e4bceb01d9f291b957ba4fa1fa66d65458690c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.2/gh-view-v0.0.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "899f57538cbeef72cd3484c30edddff41beb8030839c9247090cb25af5402635"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
