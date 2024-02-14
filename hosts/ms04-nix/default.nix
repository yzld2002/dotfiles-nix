{
  lib,
  pkgs,
  config,
  ...
}: {
  networking = {
    hostName = "ms04-nix";
    networkmanager.enable = lib.mkForce false; 
    nameservers = [ "192.168.50.1" ];
    defaultGateway = {
      address = "192.168.50.1";
      interface = "bond0";
    };
    bonds = 
    {
      bond0 = {
        interfaces = [ "enp1s0" "enp2s0" ];
        driverOptions = {
          mode = "802.3ad";
        };
      };
    };
    interfaces.bond0.ipv4.addresses = [
      {
        address = "192.168.50.21";
        prefixLength = 24;
      }
    ];
  };

  services.qemuGuest.enable = true;

  imports = [
    ./modules/traefik
    ./modules/atuin-server.nix
  ];

  hosts.traefik.enable = true;
  hosts.atuin-server.enable = true;

  # hosts.syncthing = {
  #   enable = true;
  #   ipaddress = "100.64.0.1";
  # };

  # Support gpg for git signing
  hosts.gpg.enable = true;

  # Access through headscale
  # fileSystems."/mnt/share" = {
  #   device = "//hadouken.thuis.plebian.nl/public";
  #   fsType = "cifs";
  #   options = ["credentials=${config.age.secrets.smb.path},uid=1000,gid=100"];
  # };

  hosts.docker.enable = true;
  hosts.openssh.enable = true;
}
