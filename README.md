# Configs

Central place to manage my terminal configs such as neovim, zhsrc, etc.

## Usage

I'm using [stow](https://www.gnu.org/software/stow/) to manage my configs via symlinks to this git repo.

From the repo root:

    stow --target=/Users/$USER/.config configs

This will automatically symlink all contents in configs to `~/.config`.
