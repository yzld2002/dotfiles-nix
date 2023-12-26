{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.gui;

in {
  options.modules.gui = { enable = mkEnableOption "gpg"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome foliate logseq
      jetbrains.idea-community
      android-studio
    ];
  };
}
