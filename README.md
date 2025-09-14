# dotfiles

Central place to manage my dotfiles.

|Component|Application|
|---|---|
|OS|Darwin/Linux|
|Terminal|[Ghostty](https://ghostty.org/)|
|Terminal Multiplexer|[Zellij](https://zellij.dev/)|
|Editor|Neovim ([NvChad](https://github.com/NvChad/NvChad))|
|Shell|[Fish](https://fishshell.com/)|
|Misc configs|bat, rg, yazi|

## Pre-requisites

- Install font for icons to work & update terminal accordingly.
Either use `JetBrainsMono` located in `fonts` or browse others [here](https://github.com/ryanoasis/nerd-fonts)
- Install [Nix (Package Manager)](https://nixos.org/download/)

## Usage

1. Create backups of existing configs if needed

       # backup existing installation & remove existing nvim data
       mv ~/.config/nvim ~/.config/nvim.bak
       rm -rf ~/.local/share/nvim

       # backup existing fish config
       mv ~/.config/fish/config.fish{,.bak}

2. Clone the repo & create alias to interact with it

       git clone --bare https://github.com/elsesiy/dotfiles.git $HOME/.local/share/dotfiles
       alias dgit='git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME'
       dgit status

       # restore missing files in homedir, make sure to backup local changes first if there are any conflicts i.e. modified instead of deleted files
       dgit reset && dgit restore .

       # (optional) update repo for ssh cloning
       dgit remote set-url origin git@github.com:elsesiy/dotfiles.git

3. Install packages via [Nix](#Nix)

4. Misc configuration

       # set fish as default shell
       chsh -s /run/current-system/sw/bin/fish $(whoami)

       # rebuild bat cache
       bat cache --build

       # install fish plugins
       fisher update

       # update ~/.gitconfig
       cat <<EOF >> ~/.gitconfig
       [include]
          path = ~/.config/delta/delta.gitconfig
       [include]
          path = ~/.config/git/common.gitconfig
       EOF

5. Start `nvim` and run `:MasonInstallAll`

### Nix
Supported systems: `["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"]`

All required system configuration and packages utilize nix flakes (unstable nix pkgs) with home-manager.
Depending on the target system, invocation will be different:
```
# nix-darwin (mac)
sudo nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix-modules/#personal

# home-manager (linux)
sudo nix run home-manager/master --extra-experimental-features "nix-command flakes"  -- switch --flake ~/nix-modules/#development
```

Things you'd likely want to do periodically:

- Update flakes
```
nix flake update
```

- Cleanup old derivations
```
nix-collect-garbage -d
```
