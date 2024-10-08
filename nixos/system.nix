{
  pkgs,
  config,
  outputs,
  ...
}: {
  imports = [
    ./modules/virtualization.nix
    ./modules/docker.nix
    ./modules/openssh.nix
    ./modules/gpg.nix
    ./modules/awesomewm.nix
    ./modules/font.nix
    ./modules/secrets.nix
  ];

  # User
  users.users.yzld2002 = {
    isNormalUser = true;
    description = "Zhichao Lin";
    extraGroups = ["networkmanager" "wheel" "input"];
    shell = pkgs.zsh;
    useDefaultShell = true;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3dHygJrJv/ZqC1Y8NhpghQK4hMTuacdJhcXtvfG7dN yzld2002@gmail.com" ];
  };

  environment.defaultPackages = [];
  # Global packages
  environment.systemPackages = with pkgs; [
    # for gpg
    gnupg
    pinentry

    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    tldr # man summarized

    # networking tools
    dnsutils # `dig` + `nslookup`

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    git
    # wev # wayland xev
    gcc
    wget
    config.services.headscale.package
    openssl # for CA work
    gnumake

    # samba
    cifs-utils

    htop
    btop # fancy htop
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    lsof # list open files

    # system tools
    acpi
    tlp
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    cachix # community binary caches
  ];

  # Nix settings, auto cleanup and enable flakes
  nix = {
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "yzld2002" ];
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Enable networking
  # Set up networking and secure it
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 443 80 16881 ];
      allowedUDPPorts = [ 443 80 16881 ];
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
      allowPing = true;
      # Samba sharing discovery
      extraCommands = ''
        iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns
      '';
    };
  };

  # misc
  programs.zsh.enable = true;
  programs.nix-ld.enable=true;

  # Default env variables
  environment.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    TERM = "xterm-256color";
  };

  # SMB network discovery
  services.gvfs.enable = true;

  # Boot settings: clean /tmp/, latest kernel and enable bootloader
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.editor = false;
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
  };

  # Set up locales (timezone and keyboard layout)
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Don't ask for sudo too often
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=300
  '';

  system.stateVersion = "24.05";
}
