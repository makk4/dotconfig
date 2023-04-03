#!/bin/bash
source  $HOME/.dotfilesconfig

DISTRO="$2"
SYSTEM="$3"
DOTFILES_PATH="${HOME}/.dotfiles"
SCRIPTS_PATH="${HOME}/.scripts"
INSTALL_PATH="/usr/local/bin/"
BRANCH=$branch

pull() {
  echo "pull dotfiles..."
  dotfiles pull origin ${BRANCH}
}

push() {
  head=$(dotconfig rev-parse --verify ${BRANCH})
  default=$(dotconfig rev-parse --verify origin/${BRANCH})
  if [ "$head" != "$default" ]; then
    echo "push dotfiles..."
    dotfiles push origin ${BRANCH}
  fi
}


#######################################################################
#                            MAIN                                     #
#######################################################################

uname -a

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

dotconfig diff --quiet && dotconfig diff --cached --quiet
if ! [ $? -eq 0 ]; then
  echo "commit dotfiles..."
  dotfiles commit -S -am "sync"
fi

if [ ! -z "$1" ]; then
  if [ $1 = "pull" ]; then
    pull
  fi
  if [ $1 = "push" ]; then
    push
  fi
else
  pull
  push
fi

echo "finished sync"

exit 0
