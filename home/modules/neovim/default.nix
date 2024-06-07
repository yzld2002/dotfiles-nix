{ pkgs, lib, config, ... }:
{
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
    home.file."./.config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/modules/neovim/nvim";
}
