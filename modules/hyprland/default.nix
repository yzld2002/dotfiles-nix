{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
  options.modules.hyprland= { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wofi wl-clipboard hyprland waybar dunst
    ];
    home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
