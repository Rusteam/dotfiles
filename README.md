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
make tmux   # also installs tpm plugins (vim-tmux-navigator etc.)
make omz
make vim
make p10k
```

`make` runs `vim tmux omz p10k` only.

**Install system-wide python tools:**

```
make conda
make poetry
```
