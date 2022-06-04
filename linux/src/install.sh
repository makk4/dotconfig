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

if [ -n "$1" ] && [ $1 = "fresh" ]; then;
    echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
    FILE=$HOME/.zshrc
    if test -f "$FILE"; then
        echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
    fi
fi

exit 0
