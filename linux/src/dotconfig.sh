#!/bin/zsh

logostring="       __      __  _____ __         \n  ____/ /___  / /_/ __(_) /__  _____\n / __  / __ \/ __/ /_/ / / _ \/ ___/\n/ /_/ / /_/ / /_/ __/ / /  __(__  ) \n\__,_/\____/\__/_/ /_/_/\___/____/  \n"
lolcat=$(which lolcat)
if [ "$lolcat" != "lolcat not found" ]; then
  echo "$logostring" | /usr/games/lolcat
else
  echo "$logostring"
fi

if [ ! -z "$1" ]; then 
  if [ $1 = "sync" ]; then
    source "$HOME/.scripts/src/sync.sh" $2
  fi
  if [ $1 = "update" ] || [ $1 = "up" ]; then
    source "$HOME/.scripts/src/update.sh" $2
  fi
else
  echo "Usage: dot <command> <option>"
  echo ""
  echo "Commands:"
  echo "sync        Sync dotflies"
  echo "update      Update system"
fi