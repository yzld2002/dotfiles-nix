{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "21.03";
  imports = [
    # gui
    ./hyprland
    ./kitty
    ./gui

    # cli
    ./zsh
    ./git
    ./gpg
    ./direnv
    ./neovim

    # system
    ./packages
  ];
}
