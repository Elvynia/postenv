#!/usr/bin/env bash
set -Eeuo pipefail

# Bashrc stuff.
BASHRC=$HOME/.bashrc
touch $BASHRC
cp ./linux/profile/.bash_* $HOME/
chown $USER:$GROUP $HOME/.bash_*

if ! grep -Eq '(^|\s)(\.|source)\s+~/.bash_aliases\b' "$BASHRC"; then
  {
    echo
    echo "# Loads bash aliases"
    echo '[ -f ~/.bash_aliases ] && . ~/.bash_aliases'
  } >> "$BASHRC"
fi
if ! grep -Eq '(^|\s)(\.|source)\s+~/.bash_functions\b' "$BASHRC"; then
  {
    echo
    echo "# Loads bash functions"
    echo '[ -f ~/.bash_functions ] && . ~/.bash_functions'
  } >> "$BASHRC"
fi

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
apt-get install -y fzf

if [ -t 1 ]; then
  echo
  echo "Postenv success !"
  echo "  --> source ~/.bashrc"
fi
