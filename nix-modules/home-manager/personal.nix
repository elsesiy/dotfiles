{ pkgs, unstable, ... }: {

  home.packages = [
    pkgs.cosign
    pkgs.exercism
    pkgs.exiftool
    pkgs.ffmpeg
    unstable.filen-desktop
    # unstable.floorp-bin-unwrapped
    pkgs.github-changelog-generator
    unstable.goreleaser
    pkgs.gnupg
    pkgs.gradle
    pkgs.highlight
    unstable.keepassxc
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
