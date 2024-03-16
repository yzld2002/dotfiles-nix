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
      libsForQt5.kdeconnect-kde
      libsForQt5.bismuth # tiling window manager
      libsForQt5.neochat # matrix messager
      libsForQt5.kompare # diff viewer
      libsForQt5.kate
      wl-clipboard # wayland clipboard manager
      telegram-desktop
      foliate
      obsidian

      # theming
      nordic
      materia-kde-theme
      gimp
    ];
  };
}
