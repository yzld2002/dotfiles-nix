{ pkgs, lib, config, ... }:
{
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
    home.file.".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
}
