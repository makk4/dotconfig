#!/bin/bash

cp -r src/* $HOME/.scripts/src/
ln -s $HOME/.scripts/src/dotconfig.sh $HOME/.local/bin/dotconfig

touch $HOME/.dotconfig
echo "gitsource=git@github.com:name/dotfiles.git" > $HOME/.dotconfig
echo "branch=ubuntu" > $HOME/.dotconfig

# TODO zsh, bash alias dotfiles

exit 0