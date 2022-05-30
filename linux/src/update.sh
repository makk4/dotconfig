#!/bin/zsh
DISTRO="ubuntu"
SYSTEM="wsl"
INSPATH="/home/$USER/.scripts"
SYS_UPGRADE="false"
DEV_UPGRADE="false"
PLUG_UPGRADE="false"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

sysup() {
  echo "update apt..."
  sudo apt update && sudo apt upgrade -y
  echo "autoremove..."
  sudo apt autoremove -y
  # snap
  snap_installed="$(which snap)"
  if [[ -n $snap_installed ]]
    echo "update snap apps..."
    sudo snap refresh
  fi
  if [ $SYSTEM = "native" ]; then
    # flatpak
    flatpak_installed="$(which flatpak)"
    if [[ -n $flatpak_installed ]]
      echo "update flatpak apps..."
      flatpak update
    fi
  fi

}

devup() {
  # rust
  rust_installed="$(which rustup)"
  if [[ -n $rust_installed ]]
    echo "update rust..."
    rustup update
  fi
  cargo_installed="$(which cargo)"
  if [[ -n installed ]]
    echo "upda$cargo_te cargo..."
    cargo update
  fi
  # pip
  pip_installed="$(which pip)"
  if [[ -n $pip_installed ]]
    echo "update pip..."
    read "PIP?Continue update pip packages? [y/n]?"
    if [ $PIP = "y" ]; then
      if [ $DISTRO = "ubuntu" ]; then
          python3 -m pip install --user --upgrade pip
    fi
  fi
  # npm
  npm_installed="$(which npm)"
  if [[ -n $npm_installed ]]
    echo "update npm packages..."
    NPMUP=$(npm outdated)
    if [ "$NPMUP" != "" ]; then
      npm install -g @bitwarden/cli
    fi
  fi
}

plugup() {
  # oh my zsh
  omz_installed="$(which omz)"
  if [[ -n $omz_installed ]]
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

#######################################################################
#                             MAIN                                    #
#######################################################################

source ~/.zshrc                        

# check if WSL or Native Unix
if grep -q Microsoft /proc/version; then
  echo "Linux on Windows"
  DISTRO="ubuntu"
  SYSTEM="wsl"
else
  echo "native Linux"
fi

uname -a

if [ -n "$1" ] && [ $1 = "all" ]; then; SYS_UPGRADE="true"; DEV_UPGRADE="true"; PLUG_UPGRADE="true"; WIN_UPGRADE="true"; REMOTE_UPGRADE="true"
elif [ -n "$1" ] && [ $1 = "up" ]; then; SYS_UPGRADE="true"
elif [ -n "$1" ] && [ $1 = "update" ]; then; SYS_UPGRADE="true"
elif [ -n "$1" ] && [ $1 = "dev" ]; then; DEV_UPGRADE="true"
elif [ -n "$1" ] && [ $1 = "plug" ]; then; PLUG_UPGRADE="true"
elif [ -n "$1" ] && [ $1 = "win" ]; then; WIN_UPGRADE="true"
elif [ -n "$1" ]; then; echo "Error: \"$1\" command not found"; exit 1
fi

if [ $SYS_UPGRADE = "true" ]; then
  echo "sysup"
  sysup
fi

if [ $DEV_UPGRADE = "true" ]; then
  echo "devup"
  devup
fi

if [ $PLUG_UPGRADE = "true" ]; then
  echo "plugup"
  plugup
fi

echo "update dotconfig..."
git clone git@github.com:makk4/dotfiles.git
./install.sh

echo "finished update"

exit 0