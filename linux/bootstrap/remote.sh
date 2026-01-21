#!/usr/bin/env bash
set -Eeuo pipefail

if ! command -v git >/dev/null 2>&1; then
  sudo apt-get install -y git ca-certificates
fi

TMPDIR="$(mktemp -d -t postenv.XXXXXX)"
POSTENV_PATH="$TMPDIR/sources"
trap 'rm -rf "$TMPDIR"' EXIT

REPO_URL="https://github.com/Elvynia/postenv.git"
REPO_REF="main"
git clone --depth 1 --branch "$REPO_REF" "$REPO_URL" "$POSTENV_PATH"

export POSTENV_PATH
bash "$POSTENV_PATH/linux/apply.sh"
