{ pkgs, ... }: {
  home.username = "elsesiy";
  home.homeDirectory = "/Users/elsesiy";

  home.packages = with pkgs; [
    exercism
    exiftool
    ffmpeg
    floorp
    gnupg
    gradle
    highlight
    notion-app
    pdfgrep
    podman
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-grpc-web
    tailscale
    tor
    yubikey-manager
    zig
  ];
}
