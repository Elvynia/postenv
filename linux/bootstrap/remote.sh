#!/usr/bin/env bash
set -Eeuo pipefail

if [[ "$EUID" -ne 0 ]]; then
  exec sudo -E bash -s < /dev/stdin
fi

POSTENV_USER="${SUDO_USER:-$(id -un)}"
POSTENV_HOME="$(getent passwd "$POSTENV_USER" | cut -d: -f6)"
INSTALL_DIR="$POSTENV_HOME/postenv"

apt-get update
apt-get install -y git

TMP="$(mktemp -d)"
git clone --depth 1 https://github.com/Elvynia/postenv.git "$TMP"

rm -rf "$INSTALL_DIR"
mv "$TMP" "$INSTALL_DIR"
chown -R "$POSTENV_USER:$POSTENV_USER" "$INSTALL_DIR"

POSTENV_PATH="$INSTALL_DIR" bash "$INSTALL_DIR/linux/apply.sh"
