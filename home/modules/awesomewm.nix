{ lib, pkgs, osConfig, ... }:
with lib; let
  cfg = osConfig.hosts.desktop;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      polybar
    ];
    services.picom = {
      enable = true;
      backend = "glx";
      fade = true;
      fadeSteps = [0.1 0.1];
      vSync = true;
      shadow = false;
      settings = {
        # corners
        corner-radius = 16;
        rounded-corners-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
        ];
      };
    };
    home.file.".xprofile".text = ''
      exec awesome &
      exec /home/yzld2002/.config/polybar/launch.sh &
      exec picom &
    '';
    xdg.configFile."polybar/" = {
      source = ./polybar;
      recursive = true;
    };
  };
}
