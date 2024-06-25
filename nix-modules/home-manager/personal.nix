{ pkgs, ... }: {
  home.username = "elsesiy";
  home.homeDirectory = "/Users/elsesiy";

  home.packages = [
    pkgs.insomnia
    pkgs.macfuse-stubs
    pkgs.tailscale
    pkgs.tor
    pkgs.zoom-us
  ];
}
