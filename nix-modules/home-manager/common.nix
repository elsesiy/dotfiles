{ pkgs, lib, ... }: {
  home.stateVersion = "24.05";

  home.packages = [
    pkgs.bat
    pkgs.binutils
    pkgs.clang-tools
    pkgs.cosign
    pkgs.crane
    pkgs.curl
    pkgs.fd
    pkgs.fzf
    pkgs.git
    pkgs.gnused
    # https://github.com/nvim-pack/nvim-spectre/issues/101
    (pkgs.writeShellScriptBin "gsed" "exec ${pkgs.gnused}/bin/sed \"$@\"")
    pkgs.go
    pkgs.grpcurl
    pkgs.httpie
    pkgs.hyperfine
    pkgs.jdk
    pkgs.jq
    pkgs.jqp
    pkgs.kind
    pkgs.kubebuilder
    pkgs.kubectl
    pkgs.kubectx
    pkgs.lua
    pkgs.luajitPackages.luarocks
    pkgs.less
    pkgs.meld
    pkgs.neovim
    pkgs.openssl
    pkgs.postgresql
    pkgs.procs
    pkgs.protobuf
    pkgs.python3
    pkgs.python312Packages.pip
    pkgs.rectangle
    pkgs.ripgrep
    pkgs.rustup
    pkgs.ruby
    pkgs.rubyPackages.psych
    pkgs.tcptraceroute
    pkgs.tldr
    pkgs.tokei
    pkgs.tzdata
    pkgs.watch
    pkgs.wget
    pkgs.wireshark
    pkgs.yq
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
