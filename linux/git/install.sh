#!/usr/bin/env bash
set -Eeuo pipefail

GIT_DIR="$HOME/.config/git"
MANAGED="$GIT_DIR/common.gitconfig"

mkdir -p "$GIT_DIR"
install -m 0644 common/gitconfig "$MANAGED"

git config --global --add include.path "$MANAGED" || true
