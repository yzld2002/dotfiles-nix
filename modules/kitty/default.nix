{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kitty;

in {
  options.modules.kitty = { enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "CaskaydiaCoveNerdFont";
        size = 12;
      };
      shellIntegration.enableZshIntegration = true;
      theme = "One Half Dark";
    };
  };
}

