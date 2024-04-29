# Configs

Central place to manage my terminal configs such as neovim, zhsrc, etc.

## Pre-requisites

- Install font for icons to work & update terminal accordingly.
Either use `JetBrainsMono` located in `fonts` or browse others [here](https://github.com/ryanoasis/nerd-fonts)
- Install [NvChad](https://github.com/NvChad/NvChad)
- Install [iterm2](https://iterm2.com/)
- Install [Oh My Zsh](https://ohmyz.sh/#install)
- Install [zellij](https://zellij.dev/)

## Usage

I'm using [stow](https://www.gnu.org/software/stow/) to manage my configs via symlinks to this git repo.

From the repo root:

```shell
# backup existing installation & remove existing nvim data
mv ~/.config/nvim ~/.config/nvim.bak
rm -rf ~/.local/share/nvim

# symlink configs for zellij & starship
stow --target=/Users/$USER/.config configs

# nvim
mkdir -p ~/.config/nvim && stow --target=/Users/$USER/.config/nvim nvim
mkdir -p ~/.config/nvim/ftplugin && stow --target=/Users/$USER/.config/nvim/ftplugin nvim-ftplugin
```

This will automatically symlink all contents in configs to `~/.config` and add the custom config dir to NvChad.
