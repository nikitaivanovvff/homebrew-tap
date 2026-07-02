class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.2/gh-view-v0.0.2-aarch64-apple-darwin.tar.gz"
    sha256 "5395f68a175ff7810670a417facbd4f263548aec9d8b33537491bac0efe97793"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.2/gh-view-v0.0.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bef22d3bec3fccd712acb2cdfae17d44d46e1d027119bf321979301cc3231b6b"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
