# Dotfiles Repo

Personal dotfiles to get a full dev setup on any new machine as quickly as possible.

## Principles

- Every tool installation and setup must be a **single `make` target** (one-liner to run).
- All install commands must be **documented** in the Makefile and README.
- Config files live in this repo and are symlinked into place.

## Structure

- `Makefile` — all install/setup targets. `make` runs the core ones, extras are opt-in.
- `nvim/` — Neovim config (LazyVim-based)
- `claude/` — Claude Code settings and hooks
- `tmux.conf` — tmux config
- `zshrc.conf` — zsh config (symlinked to `~/.zshrc`)
- `p10k.conf` — Powerlevel10k theme config

## Adding new tools

When adding a new tool or config:
1. Add a make target with install + symlink commands
2. Add it to the `all:` target if it's part of the core setup
3. Document it in the README
