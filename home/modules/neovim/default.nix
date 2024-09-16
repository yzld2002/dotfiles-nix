{ pkgs, lib, config, ... }:
{
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
    home.file."./.config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/yzld2002/dotfiles-nix/home/modules/neovim/nvim";
}
