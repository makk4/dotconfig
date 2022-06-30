#!/bin/zsh
DISTRO="$2"
SYSTEM="$3"

SYS_UPGRADE="false"
DEV_UPGRADE="false"
PLUG_UPGRADE="false"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

ubuntu_up() {
  echo "update apt..."
  sudo apt update && sudo apt upgrade -y
  echo "autoremove..."
  sudo apt autoremove -y
  # snap
  snap_installed="$(which snap)"
  if [[ -n $snap_installed ]]; then
    echo "update snap apps..."
    sudo snap refresh
  fi
  if [ $SYSTEM = "native" ]; then
    # flatpak
    flatpak_installed="$(which flatpak)"
    if [[ -n $flatpak_installed ]]; then
      echo "update flatpak apps..."
      flatpak update
    fi
  fi
}

turrisos_up() {
  echo -e "pkgupdate..."
  pkgupdate
  echo -e "finished..."
}

raspberrypios_up() {
  echo -e "pkg upgrade..."
  pkg upgrade
  echo -e "finished..."
}

dev_up() {
  # rust
  rust_installed="$(which rustup)"
  if [[ -n $rust_installed ]]; then
    echo "update rust..."
    rustup update
  fi
  cargo_installed="$(which cargo)"
  if [[ -n installed ]]; then
    echo "upda$cargo_te cargo..."
    cargo update
  fi
  # pip
  pip_installed="$(which pip)"
  if [[ -n $pip_installed ]]; then
    echo "update pip..."
    read "PIP?Continue update pip packages? [y/n]?"
    if [ $PIP = "y" ]; then
      if [ $DISTRO = "ubuntu" ]; then
        python3 -m pip install --user --upgrade pip
      fi
    fi
  fi
  # npm
  npm_installed="$(which npm)"
  if [[ -n $npm_installed ]]; then
    echo "update npm packages..."
    NPMUP=$(npm outdated)
    if [ "$NPMUP" != "" ]; then
      npm install -g @bitwarden/cli
    fi
  fi
}

plug_up() {
  # oh my zsh
  omz_installed="$(which omz)"
  if [[ -n $omz_installed ]]; then
    omz update
  fi
  # tmux tpm
  echo "update tmux TPM..."
  git -C ~/.tmux/plugins/tpm/ pull
  # vim and vimplug itself
  cd $HOME
  current=`dotfiles rev-parse HEAD`
  VIMUP=$(dotfiles diff $current HEAD -- .vimrc)
  if [ "$VIMUP" != "" ]; then
    echo "Vim vimplug PlugInstall..."
    vim -c 'PlugInstall' -c 'qa!'
  fi
  echo "Vim vimplug PlugUpdate..."
  vim -c 'PlugUpdate | PlugClean! | PlugUpgrade' -c 'qa!'
  cd
}

dotconfig_up() {
  echo "update dotconfig..."
  cd $HOME/.dotconfig
  chmod -x $HOME/.dotconfig/linux/src/dotconfig.sh
  git pull
  chmod +x $HOME/.dotconfig/linux/src/dotconfig.sh
}

#######################################################################
#                             MAIN                                    #
#######################################################################

source ~/.zshrc

uname -a

if [ -n "$1" ] && [ $1 = "all" ]; then; SYS_UPGRADE="true"; DEV_UPGRADE="true"; PLUG_UPGRADE="true";
elif [ -n "$1" ] && [ $1 = "update" ]; then; SYS_UPGRADE="true"
elif [ -n "$1" ] && [ $1 = "dev" ]; then; DEV_UPGRADE="true"
elif [ -n "$1" ] && [ $1 = "plug" ]; then; PLUG_UPGRADE="true"
elif [ -n "$1" ]; then; echo "Error: \"$1\" command not found"; exit 1
fi

if [ $SYS_UPGRADE = "true" ]; then
  echo "sysup"
  if [ $DISTRO = "ubuntu" ]; then
    ubuntu_up
  elif [ $DISTRO = "openwrt" ] && [ $SYSTEM = "turrisos" ]; then
    turrisos_up
  fi
  elif [ $DISTRO = "termux" ]; then
    raspberrypios_up
  fi
fi

if [ $DEV_UPGRADE = "true" ] && [ $DISTRO = "ubuntu" ]; then
  echo "devup"
  dev_up
fi

if [ $PLUG_UPGRADE = "true" ] && [ $DISTRO = "ubuntu" ]; then
  echo "plugup"
  plug_up
fi

dotconfig_up

echo "finished update"

exit 0
