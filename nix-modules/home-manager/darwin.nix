{ config, pkgs, lib, unstable, ... }: {

  home.packages = [
    unstable.filen-desktop
    pkgs.rectangle
    pkgs.utm
  ];
}
