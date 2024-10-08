{ config, lib, pkgs, ... }:
with lib; let
  cfg = config.hosts.vaultwarden;
in
{
  options.hosts.vaultwarden = {
    enable = mkEnableOption "BitwardenRS";
  };

  config = mkIf cfg.enable {
    services.vaultwarden = {
      enable = true;
      environmentFile = "${config.age.secrets.vaultwarden.path}";
      backupDir = "/var/backup/vaultwarden";
      config = {
        DOMAIN = "https://vaultwarden.yzld2002.cn";
        SIGNUPS_ALLOWED = true;
        ROCKET_ADDRESS = "0.0.0.0";
      };
    };
  };

}
