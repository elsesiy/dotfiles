{ pkgs, ... }: {
  home.username = "elsesiy";
  home.homeDirectory = "/Users/elsesiy";

  home.packages = with pkgs; [
    exercism
    exiftool
    ffmpeg
    gradle
    highlight
    pdfgrep
    podman
    tailscale
    tor
    yubikey-manager
    zig
    zoom-us
  ];
}
