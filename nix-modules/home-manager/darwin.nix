{ pkgs, ... }: {

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # terminal font, Home Manager copies it to ~/Library/Fonts/HomeManager
    meslo-lgs-nf
    rectangle
  ];
}
