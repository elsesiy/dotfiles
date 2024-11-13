fish_config theme choose "Catppuccin Mocha"

# path
fish_add_path ~/.cargo/bin
fish_add_path ~/.krew/bin
fish_add_path (go env GOPATH)/bin

# handle brew path differences
if test (uname -m) = "arm64"
    set BREW_PATH /opt/homebrew/bin/brew
else
    set BREW_PATH /usr/local/bin/brew
end
if test -x $BREW_PATH
    eval ($BREW_PATH shellenv)
end

# global opts
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim
set -Ux LANG en_US.UTF-8
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT "-c"
set -Ux RIPGREP_CONFIG_PATH ~/.config/ripgreprc
