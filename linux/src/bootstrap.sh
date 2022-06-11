#!/bin/bash
source  $HOME/.dotfilesconfig
GITSOURCE=$git
BRANCH=$branch

git clone --single-branch --branch ${BRANCH} --separate-git-dir=$HOME/.dotfiles ${GITSOURCE} tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
dotfiles add $HOME/.dotfilesconfig

exit 0
