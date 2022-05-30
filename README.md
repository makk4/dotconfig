# Dot Config

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
