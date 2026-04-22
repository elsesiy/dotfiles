{ pkgs, unstable, ... }: {

  home.packages = [
    pkgs.cosign
    pkgs.exercism
    pkgs.exiftool
    pkgs.ffmpeg
    # unstable.filen-desktop
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
    unstable.protoc-gen-go
    unstable.protoc-gen-go-grpc
    unstable.protoc-gen-grpc-web
    unstable.selene
    pkgs.tailscale
    # pkgs.tor
    # unstable.utm
    pkgs.yubikey-manager
    pkgs.zig
  ];
}
