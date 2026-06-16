# dotfiles

Personal dotfiles, managed as symlinks into `$HOME`.

## Layout

- `Agents/` — Instructions for AI coding agents
- `Editor/` — Editor and screen config
- `Git/` — Git config and global ignore rules
- `PGP/` — PGP keys
- `Profiles/` — Placeholder for environment-specific config repos
- `SSH/` — Placeholder for `~/.ssh`; keys and config are machine-local
- `Shell/` — Shell config

## Install

```sh
git clone https://github.com/takumaw/dotfiles.git ~/Config
cd ~/Config && ./install.sh
```

`install.sh` creates relative symlinks in `$HOME`, replacing existing ones,
so it is safe to re-run after layout changes.

## Profiles

`Profiles/` overlays environment-specific dotfiles, each a separate repository
cloned into `~/Config/Profiles/<name>` and gitignored here.
