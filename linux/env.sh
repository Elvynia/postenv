: "${USER:=$(id -un)}"
: "${GROUP:=$(id -gn "$USER")}"
: "${HOME:=$(getent passwd "$USER" | cut -d: -f6)}"
