#!/bin/bash

logostring="       __      __  _____ __         \n  ____/ /___  / /_/ __(_) /__  _____\n / __  / __ \/ __/ /_/ / / _ \/ ___/\n/ /_/ / /_/ / /_/ __/ / /  __(__  ) \n\__,_/\____/\__/_/ /_/_/\___/____/  \n"

lolcat=$(which lolcat)
if [ "$lolcat" != "lolcat not found" ]; then
  echo "$logostring" | /usr/games/lolcat
else
  echo "$logostring"
fi

# check if OpenWrt
if grep -q OpenWrt /proc/version; then
    INSPATH="/usr/bin/"
    DISTRO="openwrt"
    SYSTEM="turrios"
else
  # check if Termux
  if command -v termux-setup-storage; then  
    echo "Termux"
    DISTRO="termux"
    SYSTEM="android"
  fi
  # check if WSL or Native Unix
  elif grep -q Microsoft /proc/version; then
    echo "Linux on Windows"
    DISTRO="ubuntu"
    SYSTEM="wsl"
  else
    echo "native Linux"
    DISTRO="ubuntu"
    SYSTEM="native"
  fi
fi

#######################################################################
#                            MAIN                                     #
#######################################################################

if [ ! -z "$1" ]; then 
  if [ $1 = "sync" ]; then
    source "$HOME/.scripts/src/sync.sh" $2 $DISTRO $SYSTEM
  fi
  if [ $1 = "update" ] || [ $1 = "up" ]; then
    source "$HOME/.scripts/src/update.sh" $2 $DISTRO $SYSTEM
  fi
else
  echo "Usage: dotconfig <command> <option>"
  echo ""
  echo "Commands:"
  echo "sync        Sync dotflies"
  echo "update      Update system"
fi
