{ pkgs, ... }: {
  home.username = "jelsesiy"; 
  home.homeDirectory = "/Users/jelsesiy"; 

  home.packages = [
    pkgs.awscli2
    pkgs.azure-cli
    pkgs.google-cloud-sdk
    pkgs.tfswitch
    pkgs.vault
  ];
}
