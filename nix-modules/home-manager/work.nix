{ pkgs, ... }: {
  home.username = "jelsesiy"; 
  home.homeDirectory = "/Users/jelsesiy"; 

  home.packages = [
    pkgs.awscli2
    pkgs.azure-cli
    pkgs.bazelisk
    pkgs.google-cloud-sdk
    pkgs.grype
    pkgs.tfswitch
    pkgs.vault
  ];
}
