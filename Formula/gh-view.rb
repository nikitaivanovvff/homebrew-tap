class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  url "https://github.com/nikitaivanovvff/gh-view/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "4eb79d6b5565e38113ab4e25986e4f20bb708ef774da3815c5f7921d59341651"
  license "MIT"

  depends_on "rust" => :build
  depends_on "gh"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
