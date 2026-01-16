WORKDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
source "$WORKDIR/../env.sh"

cp $WORKDIR/.bash_* $HOME/
chown $USER:$GROUP $HOME/.bash_*

if [ -t 1 ]; then
  source ~/.bashrc
  echo "Postenv profile update success !"
fi
