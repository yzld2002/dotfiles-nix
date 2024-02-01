{
  lib,
  pkgs,
  config,
  ...
}: {
  networking.hostName = "m600";
  networking.interfaces.wlan0.ipv4.addresses = [
    {
      address = "192.168.50.20";
      prefixLength = 24;
    }
  ];

  hosts.desktop = {
    enable = true;
    wayland = true;
  };

  # Enable secrets + append hosts
  # hosts.secrets.hosts = true;

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

  # Docker + QEMU
  hosts.virtualization.enable = true;
  hosts.openssh.enable = true;
}
