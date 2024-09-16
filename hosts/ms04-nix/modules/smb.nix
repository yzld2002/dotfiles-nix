{ config
, lib
, pkgs
, ...
}:
with lib; let
  cfg = config.hosts.smb;
in
{
  options.hosts.smb = {
    enable = mkEnableOption "Enable Samba";
  };

  config = mkIf cfg.enable {
    services.samba-wsdd.enable = true; # make shares visible for windows 10 clients
    networking.firewall.allowedTCPPorts = [
      5357 # wsdd
    ];
    networking.firewall.allowedUDPPorts = [
      3702 # wsdd
    ];

    networking.firewall.allowPing = true;
    services.samba.openFirewall = true;

    services.samba = {
      enable = true;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";
          "hosts allow" = "*";
          "guest account" = "yzld2002";
          "map to guest" = "bad user";
          security = "user";
        };
        public = {
          path = "/home/yzld2002/download";
          browseable = "yes";
          "read only" = "no";
          "guest ok" = "yes";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "yzld2002";
          "force group" = "users";
        };
      };
    };
  };
}
