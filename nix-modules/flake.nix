{
  description = "Home Manager configuration";

  inputs = {
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/release-25.11";
    # nixpkgs.url = "github:nixos/nixpkgs/db93f9263581457386835a933ebb9d6443ff8c37";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, darwin, home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        username = "jelsesiy";
      in
    {
      packages.darwinConfigurations = let
        common_modules = [
          ./common.nix
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
              ids.gids.nixbld = 350;
              system.primaryUser = "elsesiy";
              users.users.elsesiy = {
                name = "elsesiy";
                home = "/Users/elsesiy";
                shell = pkgs.fish;
              };
              home-manager.extraSpecialArgs = { inherit inputs; username = "elsesiy"; };
              home-manager.users.elsesiy = {
                imports = [
                  ./home-manager/common.nix
                  ./home-manager/darwin.nix
                  ./home-manager/personal.nix
                ];
              };
            }
          ];
          specialArgs = { inherit pkgs unstable; };
        };
        work = darwin.lib.darwinSystem {
          inherit system;
          modules = common_modules ++ [
            ./nix-darwin/homebrew/work.nix
            {
              ids.gids.nixbld = 350;
              system.primaryUser = "${username}";
              users.users.jelsesiy = {
                name = "${username}";
                home = "/Users/jelsesiy";
                shell = pkgs.fish;
              };
              home-manager.extraSpecialArgs = { inherit inputs username; };
              home-manager.users.jelsesiy = {
                imports = [
                  ./home-manager/common.nix
                  ./home-manager/darwin.nix
                  ./home-manager/work.nix
                ] ++ nixpkgs.lib.optional (builtins.pathExists ./home-manager/optional.nix) ./home-manager/optional.nix;
              };
            }
          ];
          specialArgs = { inherit pkgs unstable; };
        };
      };

      packages.homeConfigurations = {
        remote = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/common.nix
          ];
          extraSpecialArgs = { inherit pkgs unstable inputs username; };
        };
      };
    }
  );
}
