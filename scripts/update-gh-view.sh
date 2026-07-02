#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <version>" >&2
  echo "Example: $0 v0.0.2" >&2
}

if [[ $# -ne 1 ]]; then
  usage
  exit 2
fi

input_version="$1"
if [[ "$input_version" == v* ]]; then
  tag="$input_version"
  version="${input_version#v}"
else
  version="$input_version"
  tag="v${input_version}"
fi

repo="nikitaivanovvff/gh-view"
base_url="https://github.com/${repo}/releases/download/${tag}"
mac_archive="gh-view-${tag}-aarch64-apple-darwin.tar.gz"
linux_archive="gh-view-${tag}-x86_64-unknown-linux-gnu.tar.gz"
mac_url="${base_url}/${mac_archive}"
linux_url="${base_url}/${linux_archive}"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tap_dir="$(cd "${script_dir}/.." && pwd)"
formula_path="${tap_dir}/Formula/gh-view.rb"

if [[ ! -f "$formula_path" ]]; then
  echo "Formula not found: ${formula_path}" >&2
  exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required" >&2
  exit 1
fi

fetch_sha() {
  local url="$1"
  curl -fsSL "${url}.sha256" | awk '{print $1}'
}

echo "Fetching checksums for ${tag}..." >&2
mac_sha="$(fetch_sha "$mac_url")"
linux_sha="$(fetch_sha "$linux_url")"

if [[ -z "$mac_sha" || -z "$linux_sha" ]]; then
  echo "Could not fetch one or more checksums for ${tag}" >&2
  exit 1
fi

cat > "$formula_path" <<EOF
class GhView < Formula
  desc "Terminal view for GitHub pull requests"
  homepage "https://github.com/${repo}"
  version "${version}"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "${mac_url}"
    sha256 "${mac_sha}"
  elsif OS.linux? && Hardware::CPU.intel?
    url "${linux_url}"
    sha256 "${linux_sha}"
  end

  depends_on "gh"

  def install
    bin.install "gh-view"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh-view --version")
  end
end
EOF

echo "Updated ${formula_path} to ${tag}" >&2
echo "macOS arm64 sha256: ${mac_sha}" >&2
echo "Linux x86_64 sha256: ${linux_sha}" >&2
echo >&2
echo "Next steps:" >&2
echo "  cd ${tap_dir}" >&2
echo "  git diff -- Formula/gh-view.rb" >&2
echo "  git add Formula/gh-view.rb" >&2
echo "  git commit -m 'Update gh-view to ${tag}'" >&2
echo "  git push" >&2
