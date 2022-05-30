#!/bin/bash
GITSOURCE="$1"

git clone --single-branch --branch ubuntu --separate-git-dir=$HOME/.dotfiles ${GITSOURCE} tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no

exit 0
