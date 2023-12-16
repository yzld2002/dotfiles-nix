{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "21.03";
    imports = [
        # gui
        ./firefox
        ./foot
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
