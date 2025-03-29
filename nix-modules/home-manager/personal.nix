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
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-grpc-web
    # podman doesn't compile on x86
    tailscale
    tor
    yubikey-manager
    zig
    zoom-us
  ];
}
