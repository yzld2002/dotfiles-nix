{ config, lib, inputs, ...}:

{
  imports = [ ../../modules/default.nix ];
  config.modules = {
    # gui
    eww.enable = true;
    dunst.enable = true;
    hyprland.enable = true;
    wofi.enable = true;
    kitty.enable = true;

    # cli
    nvim.enable = true;
    zsh.enable = true;
    git.enable = true;
    gpg.enable = true;
    direnv.enable = true;

    # system
    xdg.enable = true;
    packages.enable = true;
  };
}
