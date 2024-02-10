{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.hosts.gui-dev;
in {
  options.hosts.work = {
    enable = mkEnableOption "Enable packages and configuration specfic to desktop IDEs";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.idea-community
      android-studio
    ];
  };
}
