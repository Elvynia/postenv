#!/usr/bin/env bash
set -Eeuo pipefail

# Bashrc stuff.
cp -r .bashal .bashfn ~/
cat .bashrc >> ~/.bashrc

# Git config
# Target location for managed git config
GIT_CONFIG_DIR="$HOME/.config/git"
MANAGED_GITCONFIG="$GIT_CONFIG_DIR/common.gitconfig"

# Ensure directory exists
mkdir -p "$GIT_CONFIG_DIR"

# Install / update managed git config
install -m 0644 common/gitconfig "$MANAGED_GITCONFIG"

# Ensure main ~/.gitconfig exists
touch "$HOME/.gitconfig"

# Add include if not already present
if ! git config --global --get-all include.path | grep -qx "$MANAGED_GITCONFIG"; then
  git config --global --add include.path "$MANAGED_GITCONFIG"
fi

# Packages
apt install -y fzf
