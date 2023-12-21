{ config, lib, inputs, ...}:

{
  imports = [
    ../../modules/default.nix
    ./secret.nix
  ];
  config.modules = {
    # gui
    hyprland.enable = true;
    kitty.enable = true;
    gui.enable = true;

    # cli
    zsh.enable = true;
    git.enable = true;
    gpg.enable = true;
    direnv.enable = true;
    neovim.enable = true;
    dev.enable = true;

    # system
    packages.enable = true;
  };
}
