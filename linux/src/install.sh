#!/bin/bash
INSPATH="$HOME/.local/bin/dotconfig"

# check if OpenWrt
if grep -q OpenWrt /proc/version; then
    INSPATH="/usr/bin/"
fi

ln -s $HOME/.dotconfig/linux/src/dotconfig.sh $INSPATH
chmod +x $HOME/.dotconfig/linux/src/dotconfig.sh
touch $HOME/.dotfilesconfig

exit 0
