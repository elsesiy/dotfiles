{ pkgs, ... }: {
  home.username = "elsesiy";
  home.homeDirectory = "/Users/elsesiy";

  home.packages = with pkgs; [
    docker
    exercism
    exiftool
    ffmpeg
    gradle
    highlight
    pdfgrep
    # podman doesn't compile on x86
    tailscale
    tor
    yubikey-manager
    zig
    zoom-us
  ];
}
