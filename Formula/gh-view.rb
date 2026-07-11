class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.5/gh-view-v0.0.5-aarch64-apple-darwin.tar.gz"
    sha256 "7d07f634c69db8f21fd65f2a0c87baa52b538ae24f2f3c0986ceb771cc8486ee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.5/gh-view-v0.0.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e2b461e726cb56a9022f971da47a3c3db0392a4d76211a94e20e07d21c87a554"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
