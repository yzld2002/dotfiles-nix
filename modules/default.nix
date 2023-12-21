{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "21.03";
  imports = [
    # gui
    ./hyprland
    ./hyprland/fonts
    ./kitty
    ./gui

    # cli
    ./zsh
    ./git
    ./gpg
    ./direnv

    # system
    ./packages
  ];
}
