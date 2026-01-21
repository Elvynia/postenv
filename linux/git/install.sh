#!/usr/bin/env bash
source "$(dirname "$0")/../env.sh"

GIT_DIR="$HOME/.config/git"
MANAGED="$GIT_DIR/common.gitconfig"

mkdir -p "$GIT_DIR"
install -m 0644 $POSTENV_PATH/common/gitconfig "$MANAGED"

git config --global --add include.path "$MANAGED" || true
