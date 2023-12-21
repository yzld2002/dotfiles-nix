{ config, pkgs, inputs, ... }:

{
  imports = [ ./fonts ];
  # Remove unecessary preinstalled packages
  environment.defaultPackages = [ ];

  programs.zsh.enable = true;

  # Laptop-specific packages (the other ones are installed in `packages.nix`)
  environment.systemPackages = with pkgs; [
    acpi tlp git
  ];

  # Wayland stuff: enable XDG integration, allow sway to use brillo
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };

  # Nix settings, auto cleanup and enable flakes
  nix = {
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "yzld2002" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
      '';
  };

  # Boot settings: clean /tmp/, latest kernel and enable bootloader
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.editor = false;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
  };

  # Set up locales (timezone and keyboard layout)
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set up user and enable sudo
  users.users.yzld2002 = {
    isNormalUser = true;
    extraGroups = [ "input" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrXXyJpW0Wqb/cOfYgsJLTt9jFmOciMGaCvVrGrSIvPIkSnh6f9SM78K9u3p3lKjy6rjPAgk2wE8k00dUwe5gjnDQXpVpRN+v0C2taZO44bbllPLVt+bFIOA98DKO19qMb3uXGwO/Q8gaGIHQaI9wx3wHyNi/4ij91xJlBrs16M8yXsmVBAB0bGKbrv5r9CizjrMRb83kTiYUbVbLMcezTmlUQyLibeg9VnlWITUbXFhEJsC+/WXrlLNOY9/0xbPU6wmb1I2SlT8pRs8q8YTRZB544hzDU73tcjVIprjN7h4WIzvruHfiZwiFcWN+IOnvzSaUtylRYh6hjI0ip868t yzld2002@yzld2002" ];
  };

  # Set up networking and secure it
  networking = {
    wireless.iwd.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 443 80 ];
      allowedUDPPorts = [ 443 80 ];
      allowPing = true;
    };
  };

  # Set environment variables
  environment.variables = {
    NIXOS_CONFIG = "$HOME/.config/nixos/configuration.nix";
    NIXOS_CONFIG_DIR = "$HOME/.config/nixos/";
    XDG_DATA_HOME = "$HOME/.local/share";
    PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    GTK_RC_FILES = "$HOME/.local/share/gtk-1.0/gtkrc";
    GTK2_RC_FILES = "$HOME/.local/share/gtk-2.0/gtkrc";
    MOZ_ENABLE_WAYLAND = "1";
    EDITOR = "nvim";
    DIRENV_LOG_FORMAT = "";
    DISABLE_QT5_COMPAT = "0";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Security 
  security = {
  # Extra security
    protectKernelImage = true;
  };

  # Sound
  sound = {
    enable = true;
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
    firmware = [ pkgs.linux-firmware ];
  };

  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  # Do not touch
  system.stateVersion = "20.09";
}
