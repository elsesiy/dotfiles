{ pkgs, unstable, lib, username, ... }: {

  home.username = lib.mkDefault "${username}";
  home.homeDirectory = lib.mkDefault "/home/${username}";

  home.stateVersion = "24.11";

  home.packages = [
    pkgs.bat
    pkgs.binutils
    pkgs.buf
    pkgs.clang-tools
    pkgs.crane
    pkgs.curl
    pkgs.fd
    pkgs.fx
    pkgs.fzf
    pkgs.delta
    pkgs.gh-dash
    pkgs.git
    pkgs.glow
    pkgs.gum
    pkgs.gnused
    # https://github.com/nvim-pack/nvim-spectre/issues/101
    (pkgs.writeShellScriptBin "gsed" "exec ${pkgs.gnused}/bin/sed \"$@\"")
    unstable.go
    unstable.golangci-lint
    unstable.govulncheck
    pkgs.graphviz
    pkgs.grpcurl
    pkgs.hyperfine
    pkgs.jdk
    pkgs.jq
    pkgs.kind
    pkgs.krew
    pkgs.kubebuilder
    pkgs.kubectl
    pkgs.kubectx
    pkgs.lolcat
    pkgs.lua
    pkgs.luajitPackages.luarocks
    pkgs.less
    pkgs.meld
    pkgs.ncdu
    unstable.neovim
    pkgs.nodejs_22
    pkgs.openssl
    pkgs.pet
    pkgs.postgresql
    pkgs.procs
    pkgs.protobuf
    # pkgs.prr
    pkgs.python3
    pkgs.python312Packages.pip
    pkgs.ripgrep
    pkgs.ruby
    pkgs.rubyPackages.psych
    pkgs.spotify-player
    pkgs.taskwarrior-tui
    pkgs.taskwarrior3
    pkgs.tcptraceroute
    pkgs.tldr
    pkgs.tokei
    pkgs.tzdata
    pkgs.vhs
    pkgs.watch
    pkgs.wget
    pkgs.wireshark
    pkgs.wrk
    pkgs.xh
    pkgs.yq

    # rust
    unstable.cargo
    unstable.cargo-edit
    unstable.clippy
    unstable.rust-analyzer
    unstable.rustc
    unstable.rustfmt
  ];

  home.sessionVariables = {
    EDITOR = "/etc/profiles/per-user/$USER/bin/nvim";
    TERMINFO_DIRS = "/etc/profiles/per-user/$USER/share/terminfo";
    PATH = "$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH";
  };

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      auto-optimise-store = true
      trusted-users = root ${username}
    '';
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    package = lib.mkDefault pkgs.nixVersions.stable;
  };

  programs = {
    home-manager.enable = true;

    fish.enable = true;

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
