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
      opengl = {
        enable = true;
        driSupport32Bit = true;
        extraPackages = with pkgs; [rocm-opencl-icd rocm-opencl-runtime];
      };
      hardware.extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
      graphics.driSupport32Bit = true;
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
      dpi = 138;

      xkb = {
        layout = "us";
        model = "macintosh_hhk";
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];
      };  
    };
    services.displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";

      # Enable automatic login for the user.
      autoLogin.enable = true;
      autoLogin.user = "yzld2002";
    };

    # input method
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime
      ];
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
