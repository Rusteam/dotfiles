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
```

**Install system-wide python tools:**

```
make conda
make poetry
```
