{ pkgs, ... }: {
  home.username = "elsesiy";
  home.homeDirectory = "/Users/elsesiy";

  home.packages = with pkgs; [
    exercism
    exiftool
    ffmpeg
    gradle
    highlight
    insomnia
    macfuse-stubs
    pdfgrep
    tailscale
    tor
    yubikey-manager
    zoom-us
  ];
}
