class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/nikitaivanovvff/gh-view"
  version "0.0.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.4/gh-view-v0.0.4-aarch64-apple-darwin.tar.gz"
    sha256 "8b34ff7545502800dc3191deff733aa7551582ac63ad7e881952ef20bcce95f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nikitaivanovvff/gh-view/releases/download/v0.0.4/gh-view-v0.0.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c8861de9a9d02012c23e105937281f054d7e4468c269f83b67b6e4747f2c5037"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
