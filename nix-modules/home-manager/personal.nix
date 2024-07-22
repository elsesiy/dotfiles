{ pkgs, ... }: {
  home.username = "elsesiy";
  home.homeDirectory = "/Users/elsesiy";

  home.packages = [
    pkgs.exercism
    pkgs.exiftool
    pkgs.ffmpeg
    pkgs.gradle
    pkgs.highlight
    pkgs.insomnia
    pkgs.macfuse-stubs
    pkgs.pdfgrep
    pkgs.tailscale
    pkgs.tor
    pkgs.zoom-us
  ];
}
