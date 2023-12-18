{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "21.03";
    imports = [
        # gui
        ./eww
        ./dunst
        ./hyprland
        ./wofi
        ./kitty

        # cli
        ./nvim
        ./zsh
        ./git
        ./gpg
        ./direnv

        # system
        ./xdg
        ./packages
    ];
}
