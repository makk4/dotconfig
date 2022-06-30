#!/bin/bash

echo "installing scripts"
mkdir $HOME/.dotconfig
cp -r * $HOME/.dotconfig
./linux/src/install.sh

read -p "Enter git address from an exiting git repository: " gitsource
./linux/src/bootstrap.sh $gitsource
echo "git=$gitsource" > $HOME/.dotfilesconfig

read -p "Enter branch name, leaf empty for main: " branch
if [ "$branch" != "" ]; then
    echo "branch=$branch" > $HOME/.dotfilesconfig
else
    echo "branch=main" > $HOME/.dotfilesconfig
fi

echo "add aliase"
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
FILE=$HOME/.zshrc
if test -f "$FILE"; then
    echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
fi

echo "cloning git repository"
./linux/src/bootstrap.sh

exit 0
