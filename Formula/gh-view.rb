class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "1.0.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v1.0.0/gh-view-v1.0.0-aarch64-apple-darwin.tar.gz"
    sha256 "9c6a7b5b421ace3f5e353b73304f3f29e0f68ea42a65073de9ea428c344a7447"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v1.0.0/gh-view-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0bb6e33f7606c517f6d59b126d4a9dc548319199a4644bf555ebb189f45198f7"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
