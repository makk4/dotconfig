#!/bin/bash

echo "installing scripts"
./linux/src/install.sh


read -p "Enter git address from an exiting git repository: " gitsource
./linux/src/bootstrap.sh "$gitsource"
echo "git=$gitsource" > $HOME/.dotconfig

read -p "Enter branch name, leaf empty for main: " branch
if [ "$branch" != "" ]; then
    echo "branch=$branch" > $HOME/.dotconfig
else
    echo "branch=main" > $HOME/.dotconfig
fi

exit 0