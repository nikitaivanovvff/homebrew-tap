class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.1/gh-view-v0.0.1-aarch64-apple-darwin.tar.gz"
    sha256 "eb76bdb10c1e61f344f53468672ec6462242aea87e1ceffd7bfa7a63bf60d661"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.1/gh-view-v0.0.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aaca4e2c232c496363a0d98463eba0e60de90ed1adf39d199a111ee982d89a90"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
