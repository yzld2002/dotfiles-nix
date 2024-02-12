{
  lib,
  pkgs,
  config,
  ...
}: {
  networking = {
    hostName = "ms04-nix";
    networkmanager.enable = false; 
    bonds = 
    {
      bond0 = {
        interfaces = [ "enp1s0" "enp2s0" ];
        driverOptions = {
          miimon = "100";
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
  # Enable secrets + append hosts
  # hosts.secrets.hosts = true;

  # hosts.syncthing = {
  #   enable = true;
  #   ipaddress = "100.64.0.1";
  # };

  hosts.desktop.enable = false;
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
