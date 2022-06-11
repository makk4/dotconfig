#TODO read git source and path from config file
git clone --single-branch --branch "$($arg0)" --separate-git-dir=$HOME/.dotfiles "$($arg0)" tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
Remove-Item tmpdotfiles

/bash/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' config status.showUntrackedFiles no

exit 0
