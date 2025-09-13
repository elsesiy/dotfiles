{ pkgs, unstable, ... }: {

  home.packages = [
    pkgs.cosign
    pkgs.exercism
    pkgs.exiftool
    pkgs.ffmpeg
    unstable.floorp-bin
    pkgs.gnupg
    pkgs.gradle
    pkgs.highlight
    unstable.keepassxc
    pkgs.nodePackages.speed-test
    pkgs.nodePackages.vercel
    pkgs.notion-app
    pkgs.pdfgrep
    pkgs.podman
    unstable.protoc-gen-go
    unstable.protoc-gen-go-grpc
    unstable.protoc-gen-grpc-web
    pkgs.tailscale
    pkgs.tor
    pkgs.yubikey-manager
    pkgs.zig
  ];
}
