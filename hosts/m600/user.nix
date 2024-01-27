{ config, lib, inputs, ...}:

{
  imports = [
    ../../modules/default.nix
  ];
  config.modules = {
    # gui
    kde.enable = true;
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
