{
  lib,
  pkgs,
  config,
  ...
}: {
  networking.hostName = "ms04-nix";
  # networking.networkmanager.ensureProfiles.profiles = {
  #   lulu = {
  #     connection = {
  #       id= "lulu";
  #       uuid = "be1a0cf3-036b-4fa3-9b51-72142b78dfe1";
  #       type = "wifi";
  #       interface-name = "wlan0";
  #       permissions = "user:yzld2002:;";
  #     };

  #     ipv4 = {
  #       address = "192.168.50.21";
  #       gateway = "192.168.50.1";
  #       dns = "192.168.50.1";
  #       method = "manual";
  #     };

  #     ipv6 = {
  #       addr-gen-mode = "default";
  #       method = "auto";
  #     };
  #   };
  # };

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
