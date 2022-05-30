git clone --single-branch --branch ubuntu --separate-git-dir=$HOME/.dotfiles git@github.com:name/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
Remove-Item tmpdotfiles

/bash/bin/git --git-dir='$HOME/.dotfiles' --work-tree='$HOME' config status.showUntrackedFiles no
