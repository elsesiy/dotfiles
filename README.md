# Configs

Central place to manage my terminal configs such as neovim, zhsrc, etc.

## Prerequisites

- Install font for icons to work & update terminal accordingly.
Either use `MesloLGS Nerd Font` located in `fonts` or browse others [here](https://github.com/ryanoasis/nerd-fonts)

## Usage

I'm using [stow](https://www.gnu.org/software/stow/) to manage my configs via symlinks to this git repo.

From the repo root:

    stow --target=/Users/$USER/.config configs

This will automatically symlink all contents in configs to `~/.config`.
