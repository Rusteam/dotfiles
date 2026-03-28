# dotfiles
Dotfiles for zsh, nvim, etc.

## Getting started

The repository assumes that these tools have 
already been installed on a target machine.
However, extra commands need to run to install 
plugins, certain configs, etc. 
These extra commands are defined in the [ Makefile ](./Makefile).

**Install all configs**
```bash
make
```

**Install one-by-one**

```bash
make tmux
make omz
make vim
make p10k
make claude
```

**Install Neovim plugin dependencies:**

```bash
make deps
```

Installs external CLI tools required by LazyVim plugins via Homebrew: fzf, ripgrep, fd, lazygit, tree-sitter, and node.

**Install Claude Code config:**

```bash
make claude
```

Symlinks `claude/settings.json` and `claude/statusline-command.sh` into `~/.claude/`.

**Install peon-ping (audio notifications for AI agents):**

```bash
make peon
```

Installs [peon-ping](https://github.com/PeonPing/peon-ping), registers Claude Code hooks, and sets the default sound pack.

**Install system-wide python tools:**

```
make conda
make poetry
```
