#!/bin/bash
INSPATH="$HOME/.local/bin/dotconfig"

# check if OpenWrt
if grep -q OpenWrt /proc/version; then
    INSPATH="/usr/bin/"
fi

cp -r src/* $HOME/.scripts/src/
ln -s $HOME/.scripts/src/dotconfig.sh $INSPATH

chmod +x $HOME/.scripts/src/dotconfig.sh

touch $HOME/.dotconfig

# TODO zsh, bash alias dotfiles

exit 0