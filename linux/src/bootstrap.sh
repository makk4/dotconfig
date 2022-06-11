#!/bin/bash

git clone --single-branch --branch ${BRANCH} --separate-git-dir=$HOME/.dotfiles ${GITSOURCE} tmpdotfiles #TODO read git source and path from config file
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no

exit 0
