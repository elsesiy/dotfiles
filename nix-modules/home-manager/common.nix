{ pkgs, lib, ... }: {
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    binutils
    clang-tools
    cosign
    crane
    curl
    fd
    fx
    fzf
    delta
    gum
    gh-dash
    git
    glow
    gnused
    # https://github.com/nvim-pack/nvim-spectre/issues/101
    (writeShellScriptBin "gsed" "exec ${pkgs.gnused}/bin/sed \"$@\"")
    go
    grpcurl
    hyperfine
    jdk
    jq
    kind
    krew
    kubebuilder
    kubectl
    kubectx
    lolcat
    lua
    luajitPackages.luarocks
    less
    meld
    neovim
    openssl
    pet
    postgresql
    procs
    protobuf
    python3
    python312Packages.pip
    rectangle
    ripgrep
    ruby
    rubyPackages.psych
    taskwarrior-tui
    taskwarrior3
    tcptraceroute
    tldr
    tokei
    tzdata
    utm
    vhs
    watch
    wget
    wrk
    xh
    yq

    # rust
    (fenix.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
    ])
    rust-analyzer-nightly
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINFO_DIRS = "/etc/profiles/per-user/$USER/share/terminfo";
    PATH = "$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH";
  };

  nix = {
    package = lib.mkDefault pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  programs = {
    home-manager.enable = true;

    bash.enable = true;
    fish.enable = true;
    zsh.enable = true;

    atuin = {
      enable = true; # default shell integration
      settings = {
        style = "compact";
      };
    };

    eza.enable = true; # default shell integration

    gh = {
      enable = true;
      settings = {
        editor = "nvim";
        git_protocol = "ssh";
      };
    };

    starship = {
      enable = true;
      enableTransience = true;
    };

    yazi = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    zellij = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true; # default shell integrations
      options = ["--cmd cd"];
    };
  };
}
