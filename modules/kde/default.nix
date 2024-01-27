{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kde;

in {
  options.modules.kde = { enable = mkEnableOption "kde"; };
    config = mkIf cfg.enable {
    programs.plasma = {
      enable = true;

      spectacle.shortcuts = {
        captureRectangularRegion = "Print";
      };

      workspace = {
        clickItemTo = "select";
        theme = "Materia-Color";
        iconTheme = "Nordic-darker";
        colorScheme = "MateriaDark";
        lookAndFeel = "com.github.varlesh.materia-dark";
      };

      panels = [
        {
          location = "top";
          height = 41;
          widgets = [
            {
              name = "org.kde.plasma.kickoff";
              config.General.icon = "nix-snowflake-white";
            }
            "org.kde.plasma.pager"
            {
              name = "org.kde.plasma.icontasks";
              config = {
                General.launchers = [
                  "applications:chrome.desktop"
                  "applications:kitty.desktop"
                ];
              };
            }
            "org.kde.plasma.marignsseperator"
            "org.kde.plasma.panelspacer"
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.panelspacer"
            "org.kde.plasma.systemmonitor.memory"
            {
              name = "org.kde.plasma.systemmonitor.cpucore";
              config.Appearance.chartFace = "org.kde.ksysguard.linechart";
              config.Appearance.title = "cpu does zoom";
            }
            "org.kde.plasma.systemtray"
          ];
        }
      ];

      configFile = {
        "kwinrc"."Desktops"."Number" = 3;
        "kwinrc"."Desktops"."Rows" = 3;
        spectaclerc.General = {
          autoSaveImage = false;
        };
      };
    };
  };
}
