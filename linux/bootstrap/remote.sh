#!/usr/bin/env bash
set -Eeuo pipefail

if ! command -v git >/dev/null 2>&1; then
  sudo apt-get install -y git ca-certificates
fi

TMPDIR="$(mktemp -d -t postenv.XXXXXX)"
trap 'rm -rf "$TMPDIR"' EXIT

REPO_URL="https://github.com/Elvynia/postenv.git"
REPO_REF="main"
git clone --depth 1 --branch "$REPO_REF" "$REPO_URL" "$TMPDIR/postenv"

bash "$TMPDIR/postenv/linux/apply.sh"
