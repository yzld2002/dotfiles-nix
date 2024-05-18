{
  osConfig,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = osConfig.hosts.desktop;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
      telegram-desktop
      foliate
      obsidian
      gimp
    ];
  };
}
