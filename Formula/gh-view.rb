class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.1/gh-view-v0.0.1-aarch64-apple-darwin.tar.gz"
    sha256 "76605cbde3ebd0f01eabcdff5d5ba8e36720db724f5ae27d2de9f5803e4c4651"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.1/gh-view-v0.0.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "547d4bed0de4f1f4666a28e4c3b70d7297631298fad3c6e69b0d8c5d42a7d688"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
