{
  description = "Home Manager configuration";

  inputs = {
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, darwin, home-manager, flake-utils, fenix, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;

          overlays = [
            fenix.overlays.default
          ];
        };
      in
    {
      packages.darwinConfigurations = let
        common_modules = [
          ./nix-darwin/common.nix
          home-manager.darwinModules.home-manager
          ./nix-darwin/homebrew/common.nix
        ];
      in {
        personal = darwin.lib.darwinSystem {
          inherit system;
          modules = common_modules ++ [
            ./nix-darwin/homebrew/personal.nix
            {
              users.users.elsesiy = {
                name = "elsesiy";
                home = "/Users/elsesiy";
                shell = pkgs.fish;
              };
              home-manager.users.elsesiy = {
                imports = [
                  ./home-manager/common.nix
                  ./home-manager/darwin.nix
                  ./home-manager/personal.nix
                ];
              };
            }
          ];
          specialArgs = { inherit pkgs; };
        };
        work = darwin.lib.darwinSystem {
          inherit system;
          modules = common_modules ++ [
            ./nix-darwin/homebrew/work.nix
            {
              users.users.jelsesiy = {
                name = "jelsesiy";
                home = "/Users/jelsesiy";
                shell = pkgs.fish;
              };
              home-manager.users.jelsesiy = {
                imports = [
                  ./home-manager/common.nix
                  ./home-manager/darwin.nix
                  ./home-manager/work.nix
                ] ++ nixpkgs.lib.optional (builtins.pathExists ./home-manager/optional.nix) ./home-manager/optional.nix;
              };
            }
          ];
          specialArgs = { inherit pkgs; };
        };
      };

      packages.homeConfigurations = {
        remote = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/common.nix
          ];
          extraSpecialArgs = { inherit pkgs; };
        };
      };
    }
  );
}
