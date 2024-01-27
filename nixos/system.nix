{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/font.nix 
  ];
  # Remove unecessary preinstalled packages
  environment.defaultPackages = [ ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    acpi tlp git
  ];

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

  # Set up user and enable sudo
  users.users.yzld2002 = {
    isNormalUser = true;
    extraGroups = [ "input" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3dHygJrJv/ZqC1Y8NhpghQK4hMTuacdJhcXtvfG7dN yzld2002@gmail.com" ];
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
    _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on";
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
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-nord
    ];
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager = {
    # Auto loging crash
    # sddm.enable = true;
    lightdm.enable = true;

    # Enable automatic login for the user.
    autoLogin.enable = true;
    autoLogin.user = "yzld2002";

    defaultSession = "plasmawayland";
  };

  services.xserver.desktopManager.plasma5.enable = true;

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    khelpcenter
    konsole
  ];

  # Do not touch
  system.stateVersion = "20.09";
}
