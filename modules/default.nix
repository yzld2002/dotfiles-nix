{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "21.03";
  imports = [
    # gui
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./kde
    ./kitty
    ./gui

    # cli
    ./zsh
    ./git
    ./gpg
    ./direnv
    ./neovim
    ./dev

    # system
    ./packages
  ];
}
