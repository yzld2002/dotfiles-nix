{ config }: 
let
  cfg = config.hosts.desktop;
in {
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
        # wallpaper = ../assets/wallpaper2.jpg;
        colorScheme = "Nordic-bluish";
        # lookAndFeel = "com.github.varlesh.materia-dark";
      };

      panels = [
        {
          location = "top";
          height = 35;
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
                  "applications:google-chrome.desktop"
                  "applications:kitty.desktop"
                  "applications:org.kde.dolphin.desktop"
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
