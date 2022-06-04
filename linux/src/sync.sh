#!/bin/bash

source  $HOME/.dotconfig

DISTRO="$2"
SYSTEM="$3"
DOTFILES_PATH="${HOME}/.dotfiles"
SCRIPTS_PATH="${HOME}/.scripts"
INSTALL_PATH="/usr/local/bin/"
BRANCH=$branch

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias winconfig='/usr/bin/git --git-dir="/mnt/c/Users/amake/.dotfiles" --work-tree="/mnt/c/Users/amake"'

pull() {
  echo "pull dotfiles..."
  dotfiles pull origin ${BRANCH}
  source ~/.zshrc
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

source ~/.zshrc

uname -a

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
