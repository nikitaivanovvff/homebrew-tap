class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.1/gh-view-v0.0.1-aarch64-apple-darwin.tar.gz"
    sha256 "eaca82ed2d36ceb82973ae5664eafa504197883fe683fa1086cac1d2369c084b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.1/gh-view-v0.0.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cf00cbc889032a87197482f1327013fe4e15871fbd6fea0c6608197d74b168b6"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
