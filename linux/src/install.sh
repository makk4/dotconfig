#!/bin/bash
INSPATH="/usr/local/bin/dotconfig"

# check if OpenWrt
if grep -q OpenWrt /proc/version; then
    INSPATH="/usr/bin/"
elif grep -q valve /proc/version; then
    INSPATH="/usr/bin/"
fi

sudo ln -s $HOME/.dotconfig/linux/src/dotconfig.sh $INSPATH
chmod +x $HOME/.dotconfig/linux/src/dotconfig.sh
touch $HOME/.dotfilesconfig

exit 0
