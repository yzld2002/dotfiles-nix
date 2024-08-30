{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hosts.desktop;
in {
  options.hosts.desktop = {
    enable = mkEnableOption "Support Awesome desktop";
    wayland = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    environment = {
      sessionVariables = {
        BROWSER = "google-chrome-stable";
      };
    };

    # Enable opengpl
    hardware = {
      graphics = {
        enable = true;
        extraPackages = with pkgs; [ rocmPackages.clr.icd amdvlk ];
      };
    };

    # Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    # Enable the X11 windowing system.
    services.xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];

      # 3840 * 2160 on a 32' inch monitor
      # dpi.lv
      # dpi = 138;

      xkb = {
        layout = "us";
        model = "macintosh_hhk";
      };
    };
    services.displayManager = {
      sddm.enable = true;

      # Enable automatic login for the user.
      autoLogin.enable = true;
      autoLogin.user = "yzld2002";
    };
    services.desktopManager.plasma6.enable = true;

    # input method
    i18n.inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5.waylandFrontend = true;
      fcitx5.addons = with pkgs; [
        fcitx5-rime
      ];
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = true;
  };
}
