# Dot Config

Sync your personal config files with git.

```bash
       __      __  _____ __
  ____/ /___  / /_/ __(_) /__  _____
 / __  / __ \/ __/ /_/ / / _ \/ ___/
/ /_/ / /_/ / /_/ __/ / /  __(__  )
\__,_/\____/\__/_/ /_/_/\___/____/

Usage: dot <command> <option>

Commands:
backup      Backup files
sync        Sync dotflies
update      Update system
```

### Install

```bash
git clone git@github.com:makk4/dotconfig.git
```

Ubuntu or Ubuntu WSL

```
./install_linux.sh
```

Windows 10/11

```
install_windows.ps1
```



### Use

Add a file

```bash
dotfiles add .vimrc
dotconfig sync
```

Pull or push dotfiles

```bash
dotconfig sync

dotconfig sync pull

dotconfig sync push
```

Update System and all plugins and packages

```bash
dotconfig update
```

Use git commands on dotfiles

```bash
dotfiles <git command>
```

eg

```bash
dotfiles add .vimrc

dotfiles status
```

Supported Systems:

- Ubuntu
- Ubuntu WSL on Windows
- Windows

Supported Package Management Systems:

- Python Pip
- Rust Cargo
- Node npm
- tmux
- VIM vimplug
- winget on windows
- ppa on ubuntu
- flatpack on ubuntu
- snap on ubuntu
